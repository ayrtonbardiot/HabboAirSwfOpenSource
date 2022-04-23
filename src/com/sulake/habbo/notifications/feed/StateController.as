// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//com.sulake.habbo.notifications.feed.StateController

package com.sulake.habbo.notifications.feed
{
    public class StateController 
    {

        private var _SafeStr_4513:Boolean;
        private var _SafeStr_3710:Boolean;
        private var _SafeStr_4468:int = 0;
        private var _SafeStr_6680:int = 1;


        private function isActive():Boolean
        {
            return ((_SafeStr_4513) && (!(_SafeStr_3710)));
        }

        public function setEnabled(_arg_1:Boolean):int
        {
            _SafeStr_4513 = _arg_1;
            if (!isActive())
            {
                return (requestState(0));
            };
            return (setVisible());
        }

        public function setGameMode(_arg_1:Boolean):int
        {
            _SafeStr_3710 = _arg_1;
            if (!isActive())
            {
                return (requestState(0));
            };
            return (setVisible());
        }

        public function currentState():int
        {
            return (_SafeStr_4468);
        }

        public function requestState(_arg_1:int):int
        {
            if (!isActive())
            {
                _SafeStr_6680 = _arg_1;
                return (_SafeStr_4468);
            };
            _SafeStr_4468 = _arg_1;
            _SafeStr_6680 = _arg_1;
            return (_SafeStr_4468);
        }

        private function setVisible():int
        {
            var _local_1:int = _SafeStr_6680;
            if (_local_1 == 0)
            {
                _local_1 = 1;
            };
            _SafeStr_4468 = _local_1;
            _SafeStr_6680 = _local_1;
            return (_local_1);
        }


    }
}//package com.sulake.habbo.notifications.feed

// _SafeStr_3710 = "_-Ki" (String#3194, DoABC#4)
// _SafeStr_4468 = "_-X12" (String#2196, DoABC#4)
// _SafeStr_4513 = "_-fy" (String#4293, DoABC#4)
// _SafeStr_6680 = "_-v1H" (String#10206, DoABC#4)


