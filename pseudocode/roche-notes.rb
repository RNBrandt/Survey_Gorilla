# working:
# a survey has questions
# a question has answers

# not tested
# a survey has a maker

          <% winning = 0 %>
        <% if responses.length >= winning %>
        <span class="glyphicon glyphicon-star" aria-hidden="true"></span>
        <% end %>
                <% winning = responses.length if responses.length > winning %>
