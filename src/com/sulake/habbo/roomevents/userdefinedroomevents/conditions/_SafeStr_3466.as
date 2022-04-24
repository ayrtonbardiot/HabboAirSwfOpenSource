// by nota

//com.sulake.habbo.roomevents.userdefinedroomevents.conditions._SafeStr_3466

package com.sulake.habbo.roomevents.userdefinedroomevents.conditions
{
    import com.sulake.core.window._SafeStr_3133;
    import _-l12._SafeStr_1554;
    import com.sulake.core.window.components._SafeStr_3269;

    public class _SafeStr_3466 extends DefaultConditionType 
    {


        override public function get code():int
        {
            return (_SafeStr_3488.ACTOR_HAS_HANDITEM);
        }

        override public function readIntParamsFromForm(_arg_1:_SafeStr_3133):Array
        {
            var _local_2:Array = [];
            _local_2.push(getSelectedHandItemCode(_arg_1));
            return (_local_2);
        }

        override public function onEditStart(_arg_1:_SafeStr_3133, _arg_2:_SafeStr_1554):void
        {
            setSelectedHandItemByCode(_arg_1, _arg_2.intParams[0]);
        }

        private function getSelectedHandItemCode(_arg_1:_SafeStr_3133):int
        {
            var _local_3:Array = getDropMenu(_arg_1, "menu_handitem").enumerateSelection();
            var _local_2:int = getDropMenu(_arg_1, "menu_handitem").selection;
            if (_local_2 == -1)
            {
                return (0);
            };
            return (getCodeInHandItemLoc(_local_3[_local_2]));
        }

        private function setSelectedHandItemByCode(_arg_1:_SafeStr_3133, _arg_2:int):void
        {
            var _local_4:int;
            var _local_3:Array = getDropMenu(_arg_1, "menu_handitem").enumerateSelection();
            var _local_5:int = -1;
            _local_4 = 0;
            while (_local_4 < _local_3.length)
            {
                if (getCodeInHandItemLoc(_local_3[_local_4]) == _arg_2)
                {
                    _local_5 = _local_4;
                };
                _local_4++;
            };
            getDropMenu(_arg_1, "menu_handitem").selection = _local_5;
        }

        private function getCodeInHandItemLoc(_arg_1:String):int
        {
            return (parseInt(_arg_1.substr(10, (_arg_1.length - 11))));
        }

        override public function get hasSpecialInputs():Boolean
        {
            return (true);
        }

        private function getDropMenu(_arg_1:_SafeStr_3133, _arg_2:String):_SafeStr_3269
        {
            return (_SafeStr_3269(_arg_1.findChildByName(_arg_2)));
        }


    }
}//package com.sulake.habbo.roomevents.userdefinedroomevents.conditions

// _SafeStr_1554 = "_-W1B" (String#2019, DoABC#4)
// _SafeStr_3133 = "_-U1F" (String#18, DoABC#4)
// _SafeStr_3269 = "_-g14" (String#723, DoABC#4)
// _SafeStr_3466 = "_-11w" (String#15749, DoABC#4)
// _SafeStr_3488 = "_-F6" (String#2812, DoABC#4)


