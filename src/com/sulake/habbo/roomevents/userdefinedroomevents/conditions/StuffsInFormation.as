// by nota

//com.sulake.habbo.roomevents.userdefinedroomevents.conditions.StuffsInFormation

package com.sulake.habbo.roomevents.userdefinedroomevents.conditions
{
    import com.sulake.habbo.roomevents.HabboUserDefinedRoomEvents;
    import com.sulake.habbo.roomevents.userdefinedroomevents.common.SliderWindowController;
    import com.sulake.habbo.roomevents.userdefinedroomevents.UserDefinedRoomEventsCtrl;
    import com.sulake.core.window._SafeStr_3133;
    import _-l12._SafeStr_1554;
    import flash.events.Event;
    import com.sulake.core.window.components.IRadioButtonWindow;
    import com.sulake.core.window.components.ISelectorWindow;

    public class StuffsInFormation extends DefaultConditionType 
    {

        private var _roomEvents:HabboUserDefinedRoomEvents;
        private var _SafeStr_5574:SliderWindowController;


        override public function get code():int
        {
            return (_SafeStr_3488.STUFFS_IN_FORMATION);
        }

        override public function get negativeCode():int
        {
            return (_SafeStr_3488._SafeStr_6813);
        }

        override public function get requiresFurni():int
        {
            return (UserDefinedRoomEventsCtrl.STUFF_SELECTION_OPTION_BY_ID);
        }

        override public function readIntParamsFromForm(_arg_1:_SafeStr_3133):Array
        {
            var _local_2:Array = [];
            _local_2.push(_SafeStr_5574.getValue());
            _local_2.push(getFormationSelector(_arg_1).getSelected().id);
            return (_local_2);
        }

        override public function onInit(_arg_1:_SafeStr_3133, _arg_2:HabboUserDefinedRoomEvents):void
        {
            _roomEvents = _arg_2;
            _SafeStr_5574 = new SliderWindowController(_arg_2, getInput(_arg_1), _arg_2.assets, 2, 10, 1);
            _SafeStr_5574.setValue(3);
            _SafeStr_5574.addEventListener("change", onSliderChange);
            _arg_2.refreshButton(_arg_1, "move_diag", true, null, 0);
            _arg_2.refreshButton(_arg_1, "move_vrt", true, null, 0);
        }

        override public function onEditStart(_arg_1:_SafeStr_3133, _arg_2:_SafeStr_1554):void
        {
            _SafeStr_5574.setValue(_arg_2.intParams[0]);
            var _local_3:int = _arg_2.intParams[1];
            getFormationSelector(_arg_1).setSelected(getFormationRadio(_arg_1, _local_3));
        }

        override public function get hasSpecialInputs():Boolean
        {
            return (true);
        }

        private function getInput(_arg_1:_SafeStr_3133):_SafeStr_3133
        {
            return (_arg_1.findChildByName("slider_container") as _SafeStr_3133);
        }

        private function onSliderChange(_arg_1:Event):void
        {
            var _local_2:* = null;
            var _local_4:Number;
            var _local_3:int;
            if (_arg_1.type == "change")
            {
                _local_2 = (_arg_1.target as SliderWindowController);
                if (_local_2)
                {
                    _local_4 = _local_2.getValue();
                    _local_3 = _local_4;
                    _roomEvents.localization.registerParameter("wiredfurni.params.requiredformationsize", "furnis", ("" + _local_3));
                };
            };
        }

        private function getFormationRadio(_arg_1:_SafeStr_3133, _arg_2:int):IRadioButtonWindow
        {
            return (IRadioButtonWindow(_arg_1.findChildByName((("formation_" + _arg_2) + "_radio"))));
        }

        private function getFormationSelector(_arg_1:_SafeStr_3133):ISelectorWindow
        {
            return (ISelectorWindow(_arg_1.findChildByName("formation_selector")));
        }


    }
}//package com.sulake.habbo.roomevents.userdefinedroomevents.conditions

// _SafeStr_1554 = "_-W1B" (String#2019, DoABC#4)
// _SafeStr_3133 = "_-U1F" (String#18, DoABC#4)
// _SafeStr_3488 = "_-F6" (String#2812, DoABC#4)
// _SafeStr_5574 = "_-dM" (String#1109, DoABC#4)
// _SafeStr_6813 = "_-VK" (String#28819, DoABC#4)


