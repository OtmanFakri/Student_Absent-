import {initializeApp} from "firebase/app";
import firebase from "firebase/compat/app";

const firebaseConfig = {
    apiKey: "AIzaSyDXWF3B7ct77Ac4tHb30fUFAKoVXxPA5Gk",
    authDomain: "student-e20e9.firebaseapp.com",
    projectId: "student-e20e9",
    storageBucket: "student-e20e9.appspot.com",
    messagingSenderId: "136955785682",
    appId: "1:136955785682:web:c80f822c58f71e82c8580b"
};

const app=firebase.initializeApp(firebaseConfig)


export default app;