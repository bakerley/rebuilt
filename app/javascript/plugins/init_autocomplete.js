import places from 'places.js';

const initAutocomplete = () => {
  const addressInput = document.getElementById('flat_address');
  if (addressInput) {
    places({ container: addressInput });
  }
};

var places = require('places.js');
var placesAutocomplete = places({
  appId: 'YOUR_PLACES_APP_ID',
  apiKey: 'YOUR_PLACES_API_KEY',
  container: document.querySelector('#address-input')
});

export { initAutocomplete };

