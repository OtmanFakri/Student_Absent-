import React, {useEffect, useState} from 'react';
import {useCounter}  from '../utilis/Context/Stror';

function StartEnd(props) {
    const [state, actions] = useCounter();



    const [date,setdate]=useState({
        start:null,
        end:null
    })
    const setEndData =(event) =>{
        setdate({
            ...date, end: event?.target.value
        })

    }
    const setStartData =(event) =>{
     setdate({
            ...date, start: event?.target.value
        })

    }

    useEffect(() => {
        // Update the document title using the browser API
       actions.updateDate(date)
        console.log(date)
    },[date]);

    return (
        <div  className="flex items-center">
            <div className="relative">
                <div className="absolute inset-y-0 left-0 flex items-center pl-3 pointer-events-none">
                    <svg aria-hidden="true" className="w-5 h-5 text-gray-500 dark:text-gray-400" fill="currentColor"
                         viewBox="0 0 20 20" xmlns="http://www.w3.org/2000/svg">
                        <path
                              d="M6 2a1 1 0 00-1 1v1H4a2 2 0 00-2 2v10a2 2 0 002 2h12a2 2 0 002-2V6a2 2 0 00-2-2h-1V3a1 1 0 10-2 0v1H7V3a1 1 0 00-1-1zm0 5a1 1 0 000 2h8a1 1 0 100-2H6z"
                              ></path>
                    </svg>
                </div>
                <input name="start" type="number"
                       value={date?.start}
                       onChange={setStartData}
                       className="bg-gray-50 border border-gray-300 text-gray-900 text-sm rounded-lg focus:ring-blue-500 focus:border-blue-500 block w-full pl-10 p-2.5  dark:bg-gray-700 dark:border-gray-600 dark:placeholder-gray-400 dark:text-white dark:focus:ring-blue-500 dark:focus:border-blue-500"
                       placeholder="date start" />
            </div>
            <span className="mx-4 text-gray-500">to</span>
            <div className="relative">
                <div className="absolute inset-y-0 left-0 flex items-center pl-3 pointer-events-none">
                    <svg aria-hidden="true" className="w-5 h-5 text-gray-500 dark:text-gray-400" fill="currentColor"
                         viewBox="0 0 20 20" xmlns="http://www.w3.org/2000/svg">
                        <path
                              d="M6 2a1 1 0 00-1 1v1H4a2 2 0 00-2 2v10a2 2 0 002 2h12a2 2 0 002-2V6a2 2 0 00-2-2h-1V3a1 1 0 10-2 0v1H7V3a1 1 0 00-1-1zm0 5a1 1 0 000 2h8a1 1 0 100-2H6z"
                              ></path>
                    </svg>
                </div>
                <input name="end" type="number"
                       value={date?.end}
                       onChange={setEndData}
                       className="bg-gray-50 border border-gray-300 text-gray-900 text-sm rounded-lg focus:ring-blue-500 focus:border-blue-500 block w-full pl-10 p-2.5  dark:bg-gray-700 dark:border-gray-600 dark:placeholder-gray-400 dark:text-white dark:focus:ring-blue-500 dark:focus:border-blue-500"
                       placeholder="date end" />
            </div>
        </div>

);
}

export default StartEnd;