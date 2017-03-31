# Timer Trigger

The timer trigger will trigger a workflow on a scheduled interval.

![Timer Trigger](/images/workflows/triggers/timer-trigger.png "Timer Trigger")

## Configuration

The timer trigger can be configured in two different ways - by a simple interval number and unit, or by a cron configuration string. When configuring a simple interval, the unit can be "Seconds", "Minutes", "Hours", or "Days". The interval can be any positive number that evaluates to at least 1 second and less than 1 year (fractional intervals are allowed). When configuring using a cron string, it must be valid cron syntax. The base cron spec is supported, and in addition the non-standard `/`, `@yearly`, `@monthly`, `@weekly`, `@daily`, and `@hourly` syntax is supported. The non-standard `L`, `W`, `#`, `?`, `@reboot`, and `@annually` syntax is not supported.

![Timer Trigger Config](/images/workflows/triggers/timer-trigger-config.png "Timer Trigger Config")

In the above example, the workflow will be triggered every 5 minutes.

## Payload

Unlike most other triggers, there is no special data included in the payload for a timer trigger, so the `data` field is set to an empty object. The only data relevant to a timer trigger is the time at which the trigger fired, and that is just in the standard `time` field that every trigger payload has. In the general case, a timer workflow payload will look like the following:

```json
{
  "time": <time of the trigger>,
  "data": <the mqtt message payload, as a string>,
  "applicationId": <id of the current application>,
  "applicationName": <name of the current application>,
  "triggerId": <id of the timer trigger>,
  "triggerType": "timer",
  "flowId": <id of the current workflow>,
  "flowName": <name of the current workflow>,
  "globals": <object of workflow globals>
}
```

For the example workflow above, a specific payload for a triggered workflow might look like this:

```json
{
  "time": Fri Feb 19 2016 17:26:00 GMT-0500 (EST),
  "data": {},
  "applicationId": "56311a8e51645b2054eb258b",
  "applicationName": "Embree",
  "triggerId": "78fbb050d7f811e5b995b3a5b31df7d8",
  "triggerType": "timer",
  "flowId": "56c8967bb8df0f0100d62912",
  "flowName": "Electricity Pricing Data",
  "globals": {}
}
```
