import places from 'places.js';

const initAutocomplete = () => {
const addressInput = document.getElementById('worksite.address');
  if (addressInput) {
    places({ container: addressInput });
  }
};
export { initAutocomplete };