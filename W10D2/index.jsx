import React from 'react';
import ReactDOM from 'react-dom';
import Weather from './frontend/weather';

const Root = () => {
    return ( 
    <div>
        <Weather />
    </div>
    )
};

document.addEventListener('DOMContentLoaded', () => {
    ReactDOM.render(<Root/>, document.getElementById('root'))
});