# daily_habits

Hello, this is a test

Sanda's test code for Charts:

<body>
    <div class="container">
    <%= render "layouts/flash" %>
      <h1>TESTING PULL REQUESTS!!!!! THANKS FOR BEING OUT GIT MASTER BRIAN!</h1>

      <div id="myfirstchart" style="height: 250px;"></div>

<script>

new Morris.Line({
  // ID of the element in which to draw the chart.
  element: 'myfirstchart',

  // Chart data records -- each entry in this array corresponds to a point on
  // the chart.
  data: [
    { year: '2008', value: 20 },
    { year: '2009', value: 10 },
    { year: '2010', value: 5 },
    { year: '2011', value: 5 },
    { year: '2012', value: 20 }
  ],

  // The name of the data record attribute that contains x-values.
  xkey: 'year',

  // A list of names of data record attributes that contain y-values.
  ykeys: ['value'],

  // Labels for the ykeys -- will be displayed when you hover over the
  // chart.

  labels: ['Value']
});

</script>

        <%= yield %>

    </div>
  </body>
</html>




  <%= link to "Edit", , edit_user_path(@user) %>

  <% @goals_user.each do |goal| %>
    <tr>
      <td><%= link_to goal.name, users_goalshow_path(goal.name) %></td>
      <td><%= link_to "<button type='button' class='btn btn-primary'>Delete</button>".html_safe, goal, method: :delete, data: { confirm: 'Are you sure?' } %></td>
    </tr>
  <% end %>

<!-- List out the goals, collection boxes, maybe change to radio buttons later-->
<%= link to "Update Goals", user_id_goals_path(@user) %>

<!-- debugging on application page -->
<%= debug params %>
<%= debug @user %>

<<<<<<< HEAD

GRAVEYARD OF GOALS UPDATE AJAX FOR REFERENCE:










  <div class="row text-center">
    <%= bootstrap_form_for :addgoal, html:{class: 'ajax-goal-form'} do |f| %>
    <%= f.text_field :name, placeholder: "Add a new custom goal" %>
    <%= button_tag(type: 'submit', class: "btn btn-success") do %>
      <i class="glyphicon glyphicon-ok"></i>
    <% end %>
    <% end %>
  </div>
  <div class="col-xs-6 col-xs-offset-3">
    <table class="table table-striped">
      <caption class="text-center">Your Custom Goals</caption>
      <thead>
        <tr>
          <th>Goal</th>
          <th>Remove</th>
        </tr>
      </thead>
      <tbody>
        <% @users_custom_goals.each do |goal| %>
        <tr>
           <% is_active = goal.goals_users.where({user_id:@user.id,active:true}).any? %>
          <td><%= goal.name %></td>
          <td>
            <%= link_to '<span class="glyphicon glyphicon-remove"></span>'.html_safe, goal_inactive_path(:id => goal.id), :class => "btn btn-danger ajax-goal-custom-remove", :style => (is_active ? "" : "display: none") %>

          </td>
        </tr>
        <% end %>
      </tbody>
    </table>

  </div>
  <br><br>

  <div class="col-xs-6 col-xs-offset-3">
    <table class="table table-striped">
      <caption class="text-center"></caption>
      <thead>
        <tr>
          <th>Goal</th>
          <th>Type</th>
          <th></th>
        </tr>
      </thead>
      <tbody>
        <% @goals.each do |goal| %>
        <tr class="goal-row goal-type-<%= goal.goal_type.gsub(/\s+/, '-') %>">
          <td><%= goal.name.capitalize %></td>
          <td><%= goal.goal_type.capitalize %></td>
          <td>
          <% is_active = goal.goals_users.where({user_id:@user.id,active:true}).any? %>
            <%= link_to '<span class="glyphicon glyphicon-remove"></span>'.html_safe, goal_inactive_path(:id => goal.id), :class => "btn btn-danger ajax-goal-add-remove", :style => (is_active ? "" : "display: none") %>
            <%= link_to '<span class="glyphicon glyphicon-ok"></span>'.html_safe, goal_update_path(:id => goal.id), :class => "btn btn-success ajax-goal-add-remove", :style => (is_active ? "display: none" : "")  %>
          </td>
        </tr>
        <% end %>
      </tbody>
    </table>
  </div>
  <br><br>


</div>

<!--
1) ajax delete (make goals inactive) button (within table row)
2) form for custom create and make that ajax so it appears in the list of goals
3) goals add drop down with hardcoded goals (ability to select dropdown and add them to goals list)
5) counting the goals as you select prepopulated goals
-->

