import React, {useEffect, useState} from 'react';
import Login from "./Commponts/login/Login"

import {initializeApp} from "firebase/app";
import {getAuth} from "firebase/auth";
import firebase from "firebase/compat/app";
import {
    Routes,
    Route,
    Outlet, NavLink, Navigate,
} from "react-router-dom";
import Example from "./Pages/Home.jsx";
import app from "./utilis/FireBases_conf.jsx";



async function checkAuth() {
    const user = await app.auth().currentUser;
    if (user != null) {
        return false;
    } else {
        return false;
    }
    return false
}

function App() {


    return (


        <>
            <Routes>
                <Route path="/" element={checkAuth ? <Example /> : <Navigate to="/login" />} />
                <Route path="/login" element={!checkAuth ? <Example /> : <Navigate to="/" />} />
            </Routes>
            {/*
            <Routes>
                {checkAuth ?
                    (<Route

                         path="/" element={<> <Example/>  </>}
                    />
                    ) :
                    (<Route
                         path={"/login"} element={<> <Login/> <Outlet/></>}
                    />)}

            </Routes>
*/}

        </>

    )
}

export default App
