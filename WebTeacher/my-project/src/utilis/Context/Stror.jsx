import {createStore, createHook} from 'react-sweet-state';
import "firebase/compat/auth";
import app from "../FireBases_conf.jsx";

import firebase from 'firebase/compat/app';
import 'firebase/compat/firestore'


const Store = createStore({
    // value of the store on initialisation
    initialState: {
        id: app.auth().currentUser?.uid,
        Class: null,
        Date: {
            Start: null,
            End: null,
        }
    },
    // actions that trigger store mutation
    actions: {
        updateID:
            (val) =>
                ({setState, getState}) => {

                    // mutate state synchronously
                    setState({
                        id: val,
                    });
                },
        updateClass:
            (val) =>
                ({setState, getState}) => {
                    // mutate state synchronously
                    setState({
                        Class: val,
                    });
                },
        updateDate:
            (val) =>
                ({setState, getState}) => {
                    // mutate state synchronously
                    setState({
                        Date: {
                            Start: val.start,
                            End: val.end,
                        }

                    });

                },

        addRome: () => async ({setState, getState}) => {
            const refstudents = app.firestore().collection("students");
            const llist = [];
            const current = new Date();
            await refstudents.get().then(querySnapshot => {
                // Iterate through each document
                querySnapshot.forEach(doc => {
                    // Add the "type" field with a value of "student" to the document
                    const data = doc.data();
                    const newData = {
                        ...data, // Copy all existing fields
                        Attendece: false, // Add new fields
                    };
                    llist.push(newData)
                });
            }).catch(error => {
                console.error(error);
            });

            const date = `${current.getDate()}-${current.getMonth() + 1}-${current.getFullYear()}`


            await app.firestore().collection("Rom").doc(getState().Class).collection(date).doc().set(
                {
                    id: getState().id,
                    class: getState().Class,
                    Date: getState().Date,
                    students: llist
                }
            ).then(async r => {
                const st=getState().Date.Start || ''
                const en=getState().Date.end || ''
                for (const doc of llist) {
                    await app.firestore().doc(`students/${doc.student_id}`)
                        .collection("student_courses").add({
                        date: date,
                        start: st,
                        end: en,
                    })
                }
            })
        },
    },
    // optional, unique, mostly used for easy debugging
    name: 'Setdata',
});

export const useCounter = createHook(Store);
