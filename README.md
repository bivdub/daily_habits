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

<%= debug params %>
<%= debug @user %>