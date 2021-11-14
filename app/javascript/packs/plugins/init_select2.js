import $ from 'jquery';
import 'select2';

const initiateSelect2 = () => {
  $('.drop-down').select2({
    width: "100%"
  });
}


export { initiateSelect2 }