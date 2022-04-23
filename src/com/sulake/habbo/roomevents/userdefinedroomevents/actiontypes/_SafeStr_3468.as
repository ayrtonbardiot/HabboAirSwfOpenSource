// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//com.sulake.habbo.roomevents.userdefinedroomevents.actiontypes._SafeStr_3468

package com.sulake.habbo.roomevents.userdefinedroomevents.actiontypes
{
    import com.sulake.habbo.roomevents.HabboUserDefinedRoomEvents;
    import com.sulake.habbo.roomevents.userdefinedroomevents.common.SliderWindowController;
    import com.sulake.core.window._SafeStr_3133;
    import _-l12._SafeStr_1554;
    import com.sulake.core.window.components.ITextFieldWindow;
    import flash.events.Event;

    public class _SafeStr_3468 extends DefaultActionType 
    {

        private var _roomEvents:HabboUserDefinedRoomEvents;
        private var _SafeStr_5574:SliderWindowController;


        override public function get code():int
        {
            return (_SafeStr_3485.MUTE_USER);
        }

        override public function readStringParamFromForm(_arg_1:_SafeStr_3133):String
        {
            return (getMessage(_arg_1).text);
        }

        override public function readIntParamsFromForm(_arg_1:_SafeStr_3133):Array
        {
            var _local_2:Array = [];
            _local_2.push(_SafeStr_5574.getValue());
            return (_local_2);
        }

        override public function onEditStart(_arg_1:_SafeStr_3133, _arg_2:_SafeStr_1554):void
        {
            getMessage(_arg_1).text = _arg_2.stringParam;
            var _local_3:int = _arg_2.intParams[0];
            _SafeStr_5574.setValue(_local_3);
        }

        override public function get hasSpecialInputs():Boolean
        {
            return (true);
        }

        private function getMessage(_arg_1:_SafeStr_3133):ITextFieldWindow
        {
            return (ITextFieldWindow(_arg_1.findChildByName("chat_message")));
        }

        override public function validate(_arg_1:_SafeStr_3133, _arg_2:HabboUserDefinedRoomEvents):String
        {
            var _local_4:* = null;
            var _local_3:int = 100;
            if (getMessage(_arg_1).text.length > _local_3)
            {
                _local_4 = "wiredfurni.chatmsgtoolong";
                return (_arg_2.localization.getLocalization(_local_4, _local_4));
            };
            return (null);
        }

        override public function onInit(_arg_1:_SafeStr_3133, _arg_2:HabboUserDefinedRoomEvents):void
        {
            _roomEvents = _arg_2;
            _SafeStr_5574 = new SliderWindowController(_arg_2, getSlider(_arg_1), _arg_2.assets, 0, 10, 1);
            _SafeStr_5574.setValue(1);
            _SafeStr_5574.addEventListener("change", onSliderChange);
        }

        private function getSlider(_arg_1:_SafeStr_3133):_SafeStr_3133
        {
            return (_arg_1.findChildByName("slider_container") as _SafeStr_3133);
        }

        protected function onSliderChange(_arg_1:Event):void
        {
            var _local_2:* = null;
            var _local_4:Number;
            var _local_3:* = null;
            if (_arg_1.type == "change")
            {
                _local_2 = (_arg_1.target as SliderWindowController);
                if (_local_2)
                {
                    _local_4 = _local_2.getValue();
                    _local_3 = int(_local_4).toString();
                    _roomEvents.localization.registerParameter("wiredfurni.params.length.minutes", "minutes", _local_3);
                };
            };
        }

        protected function get roomEvents():HabboUserDefinedRoomEvents
        {
            return (_roomEvents);
        }

        public function get slider():SliderWindowController
        {
            return (_SafeStr_5574);
        }


    }
}//package com.sulake.habbo.roomevents.userdefinedroomevents.actiontypes

// _SafeStr_1554 = "_-W1B" (String#2019, DoABC#4)
// _SafeStr_3133 = "_-U1F" (String#18, DoABC#4)
// _SafeStr_3468 = "_-V7" (String#14016, DoABC#4)
// _SafeStr_3485 = "_-11s" (String#2865, DoABC#4)
// _SafeStr_5574 = "_-dM" (String#1109, DoABC#4)


