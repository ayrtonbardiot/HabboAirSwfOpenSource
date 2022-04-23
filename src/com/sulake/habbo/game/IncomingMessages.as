// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//com.sulake.habbo.game.IncomingMessages

package com.sulake.habbo.game
{
    import com.sulake.core.runtime._SafeStr_13;
    import com.sulake.habbo.communication._SafeStr_25;
    import _-a5._SafeStr_648;
    import _-a5._SafeStr_900;
    import _-a5._SafeStr_1021;
    import com.sulake.core.communication.messages.IMessageEvent;

    public class IncomingMessages implements _SafeStr_13 
    {

        private var _gameManager:HabboGameManager;
        private var _SafeStr_4036:Boolean = false;

        public function IncomingMessages(_arg_1:HabboGameManager)
        {
            _gameManager = _arg_1;
            var _local_2:_SafeStr_25 = _gameManager.communication;
            _local_2.addHabboConnectionMessageEvent(new _SafeStr_648(onHotelClosed));
            _local_2.addHabboConnectionMessageEvent(new _SafeStr_900(onHotelClosed));
            _local_2.addHabboConnectionMessageEvent(new _SafeStr_1021(onHotelClosed));
        }

        public function dispose():void
        {
            _gameManager = null;
            _SafeStr_4036 = true;
        }

        public function get disposed():Boolean
        {
            return (_SafeStr_4036);
        }

        private function onHotelClosed(_arg_1:IMessageEvent):void
        {
            _gameManager.hotelClosed = true;
        }


    }
}//package com.sulake.habbo.game

// _SafeStr_1021 = "_-T10" (String#9490, DoABC#4)
// _SafeStr_13 = "_-P1N" (String#326, DoABC#4)
// _SafeStr_25 = "_-G19" (String#757, DoABC#4)
// _SafeStr_4036 = "_-Mr" (String#290, DoABC#4)
// _SafeStr_648 = "_-a1e" (String#15387, DoABC#4)
// _SafeStr_900 = "_-3C" (String#14847, DoABC#4)


