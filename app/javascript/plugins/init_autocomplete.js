import places from 'places.js';

const initAutocomplete = () => {
const addressInput = document.getElementById('query_localisation');
  if (addressInput) {
    places({ container: addressInput });
  }
const localisationInput = document.getElementById('worksite_address');
  if (localisationInput) {
    places({ container: localisationInput });
  }
};

export { initAutocomplete };
