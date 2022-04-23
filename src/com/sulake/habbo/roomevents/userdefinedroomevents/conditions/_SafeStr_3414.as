// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//com.sulake.habbo.roomevents.userdefinedroomevents.conditions._SafeStr_3414

package com.sulake.habbo.roomevents.userdefinedroomevents.conditions
{
    import com.sulake.core.window.components.ITextFieldWindow;
    import com.sulake.core.window._SafeStr_3133;
    import flash.globalization.DateTimeFormatter;
    import _-l12._SafeStr_1554;

    public class _SafeStr_3414 extends DefaultConditionType 
    {


        private static function getDate(_arg_1:_SafeStr_3133, _arg_2:String):Number
        {
            return (Date.parse(ITextFieldWindow(_arg_1.findChildByName(_arg_2)).text));
        }


        override public function get code():int
        {
            return (_SafeStr_3488.DATE_RANGE_ACTIVE);
        }

        override public function readIntParamsFromForm(_arg_1:_SafeStr_3133):Array
        {
            var _local_3:Number;
            var _local_2:Array = [];
            var _local_4:Number = getDate(_arg_1, "start_date");
            if (!isNaN(_local_4))
            {
                _local_2.push(int((_local_4 / 1000)));
                _local_3 = getDate(_arg_1, "end_date");
                if (!isNaN(_local_3))
                {
                    _local_2.push(int((_local_3 / 1000)));
                };
            };
            return (_local_2);
        }

        override public function onEditStart(_arg_1:_SafeStr_3133, _arg_2:_SafeStr_1554):void
        {
            var _local_5:* = null;
            var _local_3:* = null;
            var _local_4:DateTimeFormatter = new DateTimeFormatter("en-US");
            _local_4.setDateTimePattern("yyyy/MM/dd HH:mm");
            if (_arg_2.intParams.length > 0)
            {
                _local_5 = new Date((_arg_2.intParams[0] * 1000));
                ITextFieldWindow(_arg_1.findChildByName("start_date")).text = _local_4.format(_local_5);
            }
            else
            {
                ITextFieldWindow(_arg_1.findChildByName("start_date")).text = "";
            };
            if (_arg_2.intParams.length > 1)
            {
                _local_3 = new Date((_arg_2.intParams[1] * 1000));
                ITextFieldWindow(_arg_1.findChildByName("end_date")).text = _local_4.format(_local_3);
            }
            else
            {
                ITextFieldWindow(_arg_1.findChildByName("end_date")).text = "";
            };
        }

        override public function get hasSpecialInputs():Boolean
        {
            return (true);
        }


    }
}//package com.sulake.habbo.roomevents.userdefinedroomevents.conditions

// _SafeStr_1554 = "_-W1B" (String#2019, DoABC#4)
// _SafeStr_3133 = "_-U1F" (String#18, DoABC#4)
// _SafeStr_3414 = "_-M15" (String#15182, DoABC#4)
// _SafeStr_3488 = "_-F6" (String#2812, DoABC#4)


