import React, {useCallback, useState} from 'react';
import {MdModeEditOutline} from "react-icons/md";
import {Button, flexbox, useToast} from "@chakra-ui/react";

import {useFormik} from 'formik';

import Combobox from "./Combobox.jsx";
import Checkbox from "./Combobox.jsx";
import StartEnd from "./StartEnd.jsx";

import {Formik, Form, Field} from 'formik';
import * as Yup from 'yup';
import {useCounter} from '../utilis/Context/Stror';
import firebase from "firebase/compat/app";
import "firebase/compat/auth";
import Sucessmesg from "./SuccesToast.jsx";
import app from "../utilis/FireBases_conf";

function Labo({name,valeu}) {

    return (
        <>
            <div className={"flex flex-col "}>
                <label
                    className={"text-[1rem] font-semibold inline-block  px-2  rounded  last:mr-0 mr-1 "}
                    htmlFor="test">{name}</label>

                <div className={"flex flex-row justify-between"}>
                    <label
                        className={" text-[#c2cdd6] font-semibold inline-block  px-2  rounded  last:mr-0 mr-1 text-green-800 text-sm"}
                        htmlFor="test">{valeu}</label>
                    <MdModeEditOutline className={"text-[#c2cdd6]"}/>


                </div>

            </div>
        </>
    );
}


function Enter() {
    return (
        <>
            <div
                className="relative rounded-md border border-gray-300 px-3 py-2 shadow-sm focus-within:border-indigo-600 focus-within:ring-1 focus-within:ring-indigo-600">
                <label
                    htmlFor="name"
                    className="absolute -top-2 left-2 -mt-px inline-block bg-white px-1 text-xs font-medium text-gray-900"
                >
                    Id Teacher
                </label>
                <input
                    type="text"
                    disabled
                    name="name"
                    value={firebase.auth().currentUser?.uid}
                    id="name"
                    className="block w-full border-0 p-0 text-gray-900 placeholder-gray-500 focus:ring-0 sm:text-sm"
                    placeholder="Jane Smith"
                />
            </div>
        </>
    )
}


function FormInfo(props) {
    const [state, actions] = useCounter();
    const toast = useToast()





    const handleDynamiqueForm=()=>{
        actions.updateID(app.auth().currentUser?.uid)
        const oo={
            id: state?.id,
            Class: state?.Class,
            Date:state?.Date,
        }
        actions.addRome().then(r => {
            Sucessmesg(toast)
        })

    }




    const [inptu, setinput] = useState(10)


    function updateinpute(index) {
        setinput(index)
    }


    const comp = [
        {
            name: "Id Teacher",
            valeu: state.id,
            compent: <Enter ></Enter>
        },
        {
            name: "Class",
            valeu: state.Class,
            compent: <Checkbox/>
        },
        {
            name: "Date",
            valeu: `${state.Date.Start} - ${state.Date.End}`,
            compent: <StartEnd/>
        },

    ]




    return (
        <>
            <div className={"flex flex-col flex items-stretch space-y-3 h-full  "}>
                <div
                    className={"self-center  h-[10rem] w-[10rem] bg-cover bg-[url('https://upload.wikimedia.org/wikipedia/commons/thumb/d/d0/QR_code_for_mobile_English_Wikipedia.svg/1200px-QR_code_for_mobile_English_Wikipedia.svg.png')]"}
                ></div>
                <div className={"ml-10 mr-10 space-y-5"}>

                    <form    className={"space-y-5"}>

                        {comp.map((obj, index) =>
                            index === inptu ? (
                                <div key={index}>{obj.compent}</div>
                            ) : <div key={index} onClick={() => updateinpute(index)}>
                                <Labo name={obj.name} valeu={obj.valeu}/></div>
                        )}

                    </form>
                    <button
                        onClick={()=>handleDynamiqueForm()}
                        className=" rounded-md border border-transparent bg-indigo-600 px-3 py-2 text-sm font-medium leading-4 text-white shadow-sm hover:bg-indigo-700 focus:outline-none focus:ring-2 focus:ring-indigo-500 focus:ring-offset-2 text-center w-full"
                    >
                        update
                    </button>

                </div>
            </div>
        </>
    );
}

export default FormInfo;