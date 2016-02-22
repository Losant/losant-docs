# Limits

The following are the default limits applied to each account and application. If you'd like to increase these limits, please [contact us](https://www.getstructure.io/contact-us).

<table>
  <th>Item</th><th>Limit</th>
  <tr>
    <td>Applications</td>
    <td>5 per account</td>
  </tr>
  <tr>
    <td>Workflows</td>
    <td>10 per application</td>
  </tr>
  <tr>
    <td>Devices</td>
    <td>10 per application</td>
  </tr>
  <tr>
    <td>Dashboards</td>
    <td>100 per account</td>
  </tr>
  <tr>
    <td>Incoming Messages</td>
    <td>2 per second *</td>
  </tr>
  <tr>
    <td>Outgoing Messages</td>
    <td>2 per second *</td>
  </tr>
</table>

\* Message limits are calculated over a 15 second window. This allows you to burst if needed. Devices are disconnected if the number of incoming or outgoing message exceeds 30 in a 15 second window.

Incoming messages are typically devices reporting [state](/devices/state). Outgoing messages are typically [commands](/devices/commands) being sent to devices.
