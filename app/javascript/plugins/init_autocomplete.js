import places from 'places.js';

const initAutocomplete = () => {
const addressInput = document.getElementById('query_localisation');
  if (addressInput) {
    places({ container: addressInput });
  }
};

export { initAutocomplete };
