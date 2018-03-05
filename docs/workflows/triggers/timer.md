flowclass: Cloud
flowclass: Edge 1.0.0
description: Learn more about the Losant Timer Trigger.

# Timer Trigger

The Timer Trigger will fire a workflow on a scheduled interval.

![Timer Trigger](/images/workflows/triggers/timer-trigger.png "Timer Trigger")

## Configuration

The Timer Trigger can be configured in three different ways:

* **Simple Interval**: Configure the timer to fire after a repeating period of time. Configured by using an amount and a unit - the unit can be "Seconds", "Minutes", "Hours", or "Days". The interval can be any positive number that evaluates to at least 1 second and less than 1 year (fractional intervals are allowed).
* **Simple Schedule**: Configure the timer to fire based on a simple daily schedule. Select the days of the week, and the time of day that the timer should fire.
* **Advanced**: Configure the timer to fire using a valid cron string. The base cron spec is supported, and in addition the non-standard `/`, `@yearly`, `@monthly`, `@weekly`, `@daily`, and `@hourly` syntax is supported. The non-standard `L`, `W`, `#`, `?`, `@reboot`, and `@annually` syntax is not supported.

![Timer Trigger Config](/images/workflows/triggers/timer-trigger-config.png "Timer Trigger Config")

In the above example, the timer is configured using `Simple Interval`, and is set so that the timer will fire every 5 minutes.

## Payload

Unlike most other triggers, there is no special data included in the payload for a Timer Trigger, so the `data` field is set to an empty object. The only data relevant to a Timer Trigger is the time at which the trigger fired, and that is just in the standard `time` field that every trigger payload has. In the general case, a timer workflow payload will look like the following:

```json
{
  "time": <time of the trigger>,
  "data": {},
  "applicationId": <id of the current application>,
  "applicationName": <name of the current application>,
  "triggerId": <id of the Timer Trigger>,
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
