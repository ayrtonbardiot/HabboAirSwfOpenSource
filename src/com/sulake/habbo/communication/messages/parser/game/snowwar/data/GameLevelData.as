// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//com.sulake.habbo.communication.messages.parser.game.snowwar.data.GameLevelData

package com.sulake.habbo.communication.messages.parser.game.snowwar.data
{
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    public class GameLevelData 
    {

        private var _width:int;
        private var _SafeStr_4234:int;
        private var _SafeStr_4235:String;
        private var _SafeStr_5940:Array = [];

        public function GameLevelData(_arg_1:IMessageDataWrapper)
        {
            parse(_arg_1);
        }

        public function get width():int
        {
            return (_width);
        }

        public function get height():int
        {
            return (_SafeStr_4234);
        }

        public function get heightMap():String
        {
            return (_SafeStr_4235);
        }

        public function get fuseObjects():Array
        {
            return (_SafeStr_5940);
        }

        public function parse(_arg_1:IMessageDataWrapper):void
        {
            var _local_3:int;
            var _local_4:* = null;
            _width = _arg_1.readInteger();
            _SafeStr_4234 = _arg_1.readInteger();
            _SafeStr_4235 = _arg_1.readString();
            var _local_2:int = _arg_1.readInteger();
            _local_3 = 0;
            while (_local_3 < _local_2)
            {
                _local_4 = new FuseObjectData();
                _local_4.parse(_arg_1);
                _SafeStr_5940.push(_local_4);
                _local_3++;
            };
        }


    }
}//package com.sulake.habbo.communication.messages.parser.game.snowwar.data

// _SafeStr_4234 = "_-z1j" (String#10673, DoABC#3)
// _SafeStr_4235 = "_-uh" (String#10360, DoABC#3)
// _SafeStr_5940 = "_-69" (String#6981, DoABC#3)


