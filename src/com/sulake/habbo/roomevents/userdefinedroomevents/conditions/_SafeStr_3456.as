// by nota

//com.sulake.habbo.roomevents.userdefinedroomevents.conditions._SafeStr_3456

package com.sulake.habbo.roomevents.userdefinedroomevents.conditions
{
    import com.sulake.habbo.roomevents.userdefinedroomevents.UserDefinedRoomEventsCtrl;
    import com.sulake.core.window._SafeStr_3133;
    import _-l12._SafeStr_1554;
    import com.sulake.core.window.components._SafeStr_3158;

    public class _SafeStr_3456 extends DefaultConditionType 
    {


        override public function get code():int
        {
            return (_SafeStr_3488.STATES_MATCH);
        }

        override public function get negativeCode():int
        {
            return (_SafeStr_3488.NOT_STATES_MATCH);
        }

        override public function get requiresFurni():int
        {
            return (UserDefinedRoomEventsCtrl.STUFF_SELECTION_OPTION_BY_ID);
        }

        override public function get hasStateSnapshot():Boolean
        {
            return (true);
        }

        override public function onEditStart(_arg_1:_SafeStr_3133, _arg_2:_SafeStr_1554):void
        {
            select(getStateInput(_arg_1), _arg_2.getBoolean(0));
            select(getRotationInput(_arg_1), _arg_2.getBoolean(1));
            select(getLocationInput(_arg_1), _arg_2.getBoolean(2));
        }

        private function select(_arg_1:_SafeStr_3158, _arg_2:Boolean):void
        {
            if (_arg_2)
            {
                _arg_1.select();
            }
            else
            {
                _arg_1.unselect();
            };
        }

        override public function readIntParamsFromForm(_arg_1:_SafeStr_3133):Array
        {
            var _local_2:Array = [];
            _local_2.push(getIntState(getStateInput(_arg_1)));
            _local_2.push(getIntState(getRotationInput(_arg_1)));
            _local_2.push(getIntState(getLocationInput(_arg_1)));
            return (_local_2);
        }

        override public function get hasSpecialInputs():Boolean
        {
            return (true);
        }

        private function getStateInput(_arg_1:_SafeStr_3133):_SafeStr_3158
        {
            return (_SafeStr_3158(_arg_1.findChildByName("include_state_checkbox")));
        }

        private function getRotationInput(_arg_1:_SafeStr_3133):_SafeStr_3158
        {
            return (_SafeStr_3158(_arg_1.findChildByName("include_rotation_checkbox")));
        }

        private function getLocationInput(_arg_1:_SafeStr_3133):_SafeStr_3158
        {
            return (_SafeStr_3158(_arg_1.findChildByName("include_location_checkbox")));
        }

        private function getIntState(_arg_1:_SafeStr_3158):int
        {
            return ((_arg_1.isSelected) ? 1 : 0);
        }


    }
}//package com.sulake.habbo.roomevents.userdefinedroomevents.conditions

// _SafeStr_1554 = "_-W1B" (String#2019, DoABC#4)
// _SafeStr_3133 = "_-U1F" (String#18, DoABC#4)
// _SafeStr_3158 = "_-RF" (String#812, DoABC#4)
// _SafeStr_3456 = "_-k1Q" (String#15734, DoABC#4)
// _SafeStr_3488 = "_-F6" (String#2812, DoABC#4)


