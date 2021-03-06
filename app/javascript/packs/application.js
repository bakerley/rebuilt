import "bootstrap";
import "../plugins/flatpickr"
import { transparentNavbarFooter } from '../components/_navbar';

transparentNavbarFooter();

import 'mapbox-gl/dist/mapbox-gl.css'; // <-- you need to uncomment the stylesheet_pack_tag in the layout!

import { initMapbox } from '../plugins/init_mapbox';

initMapbox();

import { initAutocomplete } from '../plugins/init_autocomplete';

initAutocomplete();

