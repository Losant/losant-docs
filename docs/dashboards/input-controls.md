# Input Controls

The Input Controls block allows you to send commands to devices, or to trigger workflows, directly from a dashboard. The block includes various input components to allow for configuring the payloads sent with those commands or triggers.

![Input Controls Dashboard](/images/dashboards/input-controls-overview.png "Input Controls Dashboard")

## Adding and Removing Controls

From the block's edit screen, controls can be added by clicking the "Add Controls" button at the bottom of the configuration panel. This will open a drop-down menu containing all of the available input types. On selection of an control type, a new configuration panel will appear for that input.

![Add Input Control](/images/dashboards/input-controls-add.png "Add Input Control")

Controls can be removed from the edit screen by clicking the trashcan icon at the right side of the control's configuration panel.

## Rearranging and Resizing Controls

On the edit screen, all controls can be resized and rearranged within the input control block. To move a control, simply tap and drag the input to a new location. To resize an input, click and hold the handle in the bottom right corner of the control and drag the control to its new width.

![Rearranging Input Controls](/images/dashboards/input-controls-dragdrop.png "Rearranging Input Controls")

## Control Configuration

The block supports inputs of four types. Those inputs share a few common attributes:

*   **Label**: All controls require a label attribute.
*   **Color**: Controls other than text inputs can optionally be given a custom color.
*   **Input ID:** Controls other than buttons are automatically assigned an ID, which can be used when constructing your command / workflow payloads.

### Range Inputs

Range inputs allow for the setting of **number** values. When configuring the input, it is necessary to define the range's minimum, maximum and default values, as well as the step size (the size of each "tick" in the range slider).

![Range Input](/images/dashboards/input-controls-range-input.png "Range Input")

From the dashboard, the input's knob can be dragged left or right to set the numerical value to be sent in the payload. The area to the left of the knob will appear in the color selected during configuration.

### Toggle Inputs

Toggle inputs allow for the setting of **boolean** values (true or false). The default value must be set.

![Toggle Input](/images/dashboards/input-controls-toggle-input.png "Toggle Input")

From the dashboard, the toggle can be flipped between the two values. When set to **true**, the toggle's background will match the color chosen for it during configuration.

### Button Inputs

Buttons are responsible for triggering device commands or workflows when clicked. Without a button, the other controls within the input controls block are useless, so make sure your block has at least one button within it.

![Button Input](/images/dashboards/input-controls-send-command.png "Button Input")

If you'd like your button press to trigger a [device command](/devices/commands/), select the **Send Device Command** radio button. This will display two required input fields:

*   **Device IDs / Tags**: A [device query](/devices/device-queries/) for which device(s) should receive the command. Note that the only available devices are the ones within the block's currently selected application.
*   **Command Name**: The command that should be sent to the device(s).

If your button should trigger a [workflow](/workflows/overview/), select the **Trigger Workflow** radio button. This will display one required input field:

*   **Workflow Virtual Button**: In order to trigger a workflow, you must have at least one workflow within the selected application, and at least one [virtual button](/workflows/triggers/virtual-button/) within that workflow. This input will display all virtual buttons across all of the application's workflows, from which one must be selected to trigger when the button is pressed.

![Select Virtual Button](/images/dashboards/input-controls-trigger-workflow.png "Select Virtual Button")
