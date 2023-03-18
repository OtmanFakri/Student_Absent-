/* This example requires Tailwind CSS v2.0+ */
import {Fragment, useState} from 'react'
import {Dialog, Menu, Transition} from '@headlessui/react'
import {XMarkIcon} from '@heroicons/react/24/outline'
import {EllipsisVerticalIcon} from '@heroicons/react/20/solid'
import {Tabs, TabList, TabPanels, Tab, TabPanel} from '@chakra-ui/react'
import FormInfo from "./FormInfo.jsx";

const tabs = [
    {name: 'New', href: '#', current: true,
    tabCom:<FormInfo></FormInfo>,
    },
    {name: 'student', href: '#', current: true,
        tabCom:<p>test</p>,}]
const team = [{
    name: 'Leslie Alexander',
    handle: 'lesliealexander',
    href: '#',
    imageUrl: 'https://images.unsplash.com/photo-1494790108377-be9c29b29330?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=facearea&facepad=2&w=256&h=256&q=80',
    status: 'online',
}, // More people...
]

function classNames(...classes) {
    return classes.filter(Boolean).join(' ')
}

export default function Slide(props) {
    return (<Transition.Root show={props.isopen} as={Fragment}>
        <Dialog as="div" className="relative z-10" onClose={props.setcoles}>
            <div className="fixed inset-0"/>

            <div className="fixed inset-0 overflow-hidden">
                <div className="absolute inset-0 overflow-hidden">
                    <div className="pointer-events-none fixed inset-y-0 right-0 flex max-w-full pl-10 sm:pl-16">
                        <Transition.Child
                            as={Fragment}
                            enter="transform transition ease-in-out duration-500 sm:duration-700"
                            enterFrom="translate-x-full"
                            enterTo="translate-x-0"
                            leave="transform transition ease-in-out duration-500 sm:duration-700"
                            leaveFrom="translate-x-0"
                            leaveTo="translate-x-full"
                        >
                            <Dialog.Panel className="pointer-events-auto w-screen max-w-md">
                                <div className="flex h-full flex-col overflow-y-scroll bg-white shadow-xl">
                                    <div className="p-6">
                                        <div className="flex items-start justify-between">
                                            <Dialog.Title
                                                className="text-lg font-medium text-gray-900">Information</Dialog.Title>
                                            <div className="ml-3 flex h-7 items-center">
                                                <button
                                                    type="button"
                                                    className="rounded-md bg-white text-gray-400 hover:text-gray-500 focus:ring-2 focus:ring-indigo-500"
                                                    onClick={() => props.setcoles(!props.isopen)
                                                    }
                                                >
                                                    <span className="sr-only">Close panel</span>
                                                    <XMarkIcon className="h-6 w-6" aria-hidden="true"/>
                                                </button>
                                            </div>
                                        </div>
                                    </div>
                                    {/* tab */}
                                    <Tabs>
                                        <TabList>
                                            {tabs.map((tab, index) => (
                                                <Tab key={index}>{tab.name}</Tab>
                                            ))}
                                        </TabList>
                                        <TabPanels>
                                            {tabs.map((tab, index) => (
                                                <TabPanel p={4} key={index}>
                                                    {tab.tabCom}
                                                </TabPanel>
                                            ))}
                                        </TabPanels>
                                    </Tabs>


                                    {/* endtab */}
                                </div>
                            </Dialog.Panel>
                        </Transition.Child>
                    </div>
                </div>
            </div>
        </Dialog>
    </Transition.Root>)
}