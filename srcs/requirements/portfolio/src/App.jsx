import React, { useEffect } from 'react';

import './css/style.scss';

import AOS from 'aos';

import Home from './pages/Home';

function App() {


  useEffect(() => {
    AOS.init({
      once: true,
      disable: 'phone',
      duration: 700,
      easing: 'ease-out-cubic',
    });
  });

  return (
    <>
	<Home />
    </>
  );
}

export default App;
