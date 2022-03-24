import React, { useState, useEffect } from 'react';
import { Link } from 'react-router-dom';
function Header() {

  const [top, setTop] = useState(true);

  // detect whether user has scrolled the page down by 10px 
  useEffect(() => {
    const scrollHandler = () => {
      window.pageYOffset > 10 ? setTop(false) : setTop(true)
    };
    window.addEventListener('scroll', scrollHandler);
    return () => window.removeEventListener('scroll', scrollHandler);
  }, [top]);  
  return (
    <header className={`fixed w-full z-30 md:bg-opacity-90 transition duration-300 ease-in-out ${!top && 'bg-white backdrop-blur-sm shadow-lg'}`}>
      <div className="max-w-6xl mx-auto px-5 sm:px-6">
        <div className="flex items-center justify-between h-16 md:h-20">

          {/* Site branding */}
            {/* Logo */}
			{/* Add title to logo*/}
			{/*allign items next to each other tailwind */}
		  <div className="flex items-center">
			  	<div className='text-2xl md:text-3xl font-bold'>M</div>
				<Link to="/" className="block" aria-label="Cruip">
				<svg className="w-8 h-8 anmiatelogo" viewBox="0 0 32 32" xmlns="http://www.w3.org/2000/svg">
					<defs>
					<radialGradient cx="21.152%" cy="86.063%" fx="21.152%" fy="86.063%" r="79.941%" id="header-logo">
					<stop stopColor="#8929AD" offset="0%" >
						<animate attributeName="stopColor" values="#8929AD; #436AAC; #8929AD" dur="4s" repeatCount="indefinite"></animate>
					</stop>
					<stop stopColor="#436AAC" offset="25%" >
						<animate attributeName="stopColor" values="#436AAC; #43B7B8; #436AAC;" dur="4s" repeatCount="indefinite"></animate>
					</stop>
					<stop stopColor="#43B7B8" offset="100%" >
						<animate attributeName="stopColor" values="#43B7B8;  #436AAC; #43B7B8" dur="4s" repeatCount="indefinite"></animate>
					</stop>
					</radialGradient>
					</defs>
					<rect width="32" height="32" rx="16" fill="url(#header-logo)" fillRule="nonzero" />
				</svg>
				</Link>
				<div className='text-2xl md:text-3xl font-bold'>ERRADI</div>
			</div>
			{/* Add title to logo*/}
        </div>
      </div>
    </header>
  );
}

export default Header;
