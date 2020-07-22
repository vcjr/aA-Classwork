import React from 'react';

const toQueryString = (obj) => {
    const parts = [];
    for (let i in obj) {
        if (obj.hasOwnProperty(i)) {
            parts.push(`${encodeURIComponent(i)}=${encodeURIComponent(obj[i])}`);
        }
    }
    return parts.join('&');
}

class Weather extends React.Component {
    constructor (props) {
        super(props);

        this.state = {
            weather: null
        }

        this.getWeather = this.getWeather.bind(this);
    }

    componentDidMount() {
        debugger
        navigator.geolocation.getCurrentPosition(this.getWeather);
        debugger
    }
    
    getWeather(location) {
    // api.openweathermap.org/data/2.5/weather?lat={lat}&lon={lon}&appid={your api key}
        let url = "api.openweathermap.org/data/2.5/weather?";
        const params = {
            lat: location.coords.latitude,
            lon: location.coords.longitude
        };

        url += toQueryString(params);
        const apiKey = "c8724df76017e3994731dcf4bcdd7d20";
        url += `&appid=${apiKey}`;
        
        const xmlhttp = new XMLHttpRequest();
        xmlhttp.onreadystatechange = () => {
            if ( xmlhttp.status === 200 && xmlhttp.readyState === XMLHttpRequest.DONE){
                const info = JSON.parse(xmlhttp.responseText);
                this.setState({weather: info});
            }
        };

        xmlhttp.open('GET', url, true);
        xmlhttp.send();
    }

    render () {
        return (
        <h1>Weather Widget Working!!!</h1>
        <span>{this.state.weather.lon}</span>
        )

    }
}

export default Weather;
