// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//com.sulake.habbo.communication.messages.parser.game.snowwar.data.FullGameStatusData

package com.sulake.habbo.communication.messages.parser.game.snowwar.data
{
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    public class FullGameStatusData 
    {

        private var _SafeStr_8401:int;
        private var _SafeStr_8402:int;
        private var _SafeStr_5732:GameObjectsData;
        private var _numberOfTeams:int;
        private var _SafeStr_8403:GameStatusData;

        public function FullGameStatusData(_arg_1:IMessageDataWrapper)
        {
            parse(_arg_1);
        }

        public function get remainingTimeSeconds():int
        {
            return (_SafeStr_8401);
        }

        public function get durationInSeconds():int
        {
            return (_SafeStr_8402);
        }

        public function get gameObjects():GameObjectsData
        {
            return (_SafeStr_5732);
        }

        public function get numberOfTeams():int
        {
            return (_numberOfTeams);
        }

        public function get gameStatus():GameStatusData
        {
            return (_SafeStr_8403);
        }

        public function parse(_arg_1:IMessageDataWrapper):void
        {
            _arg_1.readInteger();
            _SafeStr_8401 = _arg_1.readInteger();
            _SafeStr_8402 = _arg_1.readInteger();
            _SafeStr_5732 = new GameObjectsData(_arg_1);
            _arg_1.readInteger();
            _numberOfTeams = _arg_1.readInteger();
            _SafeStr_8403 = new GameStatusData(_arg_1);
        }


    }
}//package com.sulake.habbo.communication.messages.parser.game.snowwar.data

// _SafeStr_5732 = "_-AT" (String#7285, DoABC#3)
// _SafeStr_8401 = "_-2p" (String#6704, DoABC#3)
// _SafeStr_8402 = "_-y1R" (String#10590, DoABC#3)
// _SafeStr_8403 = "_-Ex" (String#7525, DoABC#3)


