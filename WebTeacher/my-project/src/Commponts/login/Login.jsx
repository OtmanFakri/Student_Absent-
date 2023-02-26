import React from 'react';
import { useFormik } from 'formik';


function Login(props) {

    const validate = values => {
        const errors = {};
        if (!values.email) {
          errors.email = 'Email is required';
        } else if (!/\S+@\S+\.\S+/.test(values.email)) {
          errors.email = 'Invalid email address';
        }
        if (!values.password) {
          errors.password = 'Password is required';
        } else if (values.password.length < 8) {
          errors.password = 'Password must be at least 8 characters long';
        }
        return errors;
      };

    const formik = useFormik({
        initialValues: {
          email: '',
          password: '',
        },
        validate:validate,
        onSubmit: values => {
          alert(JSON.stringify(values, null, 2));
          console.log("values.email")
        },
        
        
      });




    return (
     <>
<div className="flex h-screen items-center justify-center ">
  <div className="bg-gray-200 h-[60%] w-[35%] p-6   rounded-lg shadow-[rgba(13,_38,_76,_0.19)_0px_9px_20px]">
        
        <p className='text-center'>Login </p>

    <div className="flex h-full w-full justify-center items-center">
  <form onSubmit={formik.handleSubmit}>
    <div className="mb-3 w-[24rem]">
      <label className="block text-gray-700 font-bold mb-2" htmlFor="username">
        Username
      </label>
      <input onBlur={formik.handleBlur} onChange={formik.handleChange} value={formik.values.email}
      className="shadow appearance-none border rounded w-full py-2 px-3 text-gray-700 leading-tight focus:outline-none focus:shadow-outline" id="email" type="email" placeholder="Username" />
          {formik.touched.email && formik.errors.email ? (
        <div>{formik.errors.email}</div>
      ) : null}
    </div>
    <div className="mb-6">
      <label className="block text-gray-700 font-bold mb-2" htmlFor="password">
        Password
      </label>
      <input  onBlur={formik.handleBlur} onChange={formik.handleChange} value={formik.values.password} className="shadow appearance-none border rounded w-full py-2 px-3 text-gray-700 leading-tight focus:outline-none focus:shadow-outline" id="password" type="password" placeholder="Password" />
      {formik.touched.password && formik.errors.password ? (
        <div>{formik.errors.password}</div>
      ) : null}
    </div>

    <button type='submit' className=" bg-blue-500 w-full hover:bg-blue-700 text-white font-bold py-2 px-4 rounded">
  Button
</button>

  </form>
</div>


  </div>
</div>

    </>
    )
}



export default Login;