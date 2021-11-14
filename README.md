# README

# Select2 with simple_form_for
[Select2 - Official Website](https://select2.org/)<br>
[Le Wagon instructions](https://kitt.lewagon.com/knowledge/tutorials/select2) <br>

## Files requiring your intervention:
- ``` ini_select2.js ``` *(needs to be created, see bellow)*
- ``` application.js ```
- Your ```view.html.erb``` file where you will be implementing your drop-down menu
- ``` Gemfile```
- ```application.scss```

## Javascript plugin installation and implementation

**Step 1:** <br>
Run these 2 commands in your terminal <br>
```yarn add jquery``` *(Select2 plugin is dependent on Jquery)*<br>
```yarn add select2```<br>
<br>

**Step 2:** Create a *init_select2.js* file in a ```javascript/packs/plugins``` folder <br>
<br>

**Step 3:** Implement the following code in your ```javascript/packs/plugins/init_select2.js``` file: <br>
```
import $ from 'jquery';
import 'select2';

const initiateSelect2 = () => {
  $('.drop-down').select2({
    width: "100%" // optional
  });
}

export { initiateSelect2 }
```
**Note: the _'.drop-down'_ refers to the class of the targeted drop-down menu**
<br>

**Step 4:** Import the *Select2* function in your ```application.js``` file: <br>
```
import { initiateSelect2 } from './plugins/init_select2'

document.addEventListener('turbolinks:load', () => {
  initiateSelect2();
});
```
<br>

**Intermediary Step** <br>
*Select2* comes with styling files stored in the package. To implement the css file, include the following line in your ``` application.scss ``` file: <br>
``` @import 'select2/dist/css/select2'; ```
<br><br>

**Step 5:**
Implement *select2* in your Application with a simple ```<select> </select>``` tag: <br>
*(go directly to step 6 if you want to implement Select2 into your simple_form_for form)*<br>
```
<select class="drop-down" name="state">
  <option value="AL">Alabama</option>
    ...
  <option value="WY">Wyoming</option>
</select>
```
**Note: the _'.drop-down'_ is the class targeted by Select2**
<br>
## Installing the gem to use Select2 with simple_form_for

**Step 6:**
To use *Select2* inside a *simple_form_for* form, install the ``` select2_simple_form ``` **gem** <br>
- Go to your **Gemfile**
- Add the following gem: ```gem 'select2_simple_form', github: 'lndl/select2_simple_form', tag: '0.7.3' ```
- Run ```bundle``` in your terminal
<br>

**Step 7:**
In your simple_form include the following attributes: ```as: :select2, input_html: { class: "drop-down"}``` <br>
*For example:* <br>
```
  <%= simple_form_for [@list, @bookmark] do |f| %>
    <%= f.association :movie, as: :select2, input_html: { class: "drop-down"} %>
    <%= f.input :comment %>
    <%= f.submit "Add movie" %>
  <% end %>
```
<br>

**[More information on the gem](https://github.com/lndl/select2_simple_form)**
