// by nota

//com.sulake.habbo.communication.messages.parser.game.snowwar.data.GameStatusData

package com.sulake.habbo.communication.messages.parser.game.snowwar.data
{
    import com.sulake.core.utils._SafeStr_24;
    import com.sulake.core.communication.messages.IMessageDataWrapper;
    import _-CV.SnowWarGameEventData;

    public class GameStatusData 
    {

        private var _SafeStr_6163:int;
        private var _SafeStr_8434:int;
        private var _SafeStr_8435:_SafeStr_24;

        public function GameStatusData(_arg_1:IMessageDataWrapper)
        {
            parse(_arg_1);
        }

        public function get turn():int
        {
            return (_SafeStr_6163);
        }

        public function get checksum():int
        {
            return (_SafeStr_8434);
        }

        public function get events():_SafeStr_24
        {
            return (_SafeStr_8435);
        }

        public function parse(_arg_1:IMessageDataWrapper):void
        {
            var _local_5:int;
            var _local_6:int;
            var _local_8:* = null;
            var _local_7:int;
            var _local_3:int;
            var _local_4:* = null;
            _SafeStr_6163 = _arg_1.readInteger();
            _SafeStr_8434 = _arg_1.readInteger();
            _SafeStr_8435 = new _SafeStr_24();
            var _local_2:int = _arg_1.readInteger();
            _local_5 = 0;
            while (_local_5 < _local_2)
            {
                _local_6 = _arg_1.readInteger();
                _local_8 = [];
                _local_7 = 0;
                while (_local_7 < _local_6)
                {
                    _local_3 = _arg_1.readInteger();
                    _local_4 = SnowWarGameEventData.create(_local_3);
                    if (_local_4)
                    {
                        _local_4.parse(_arg_1);
                        _local_8.push(_local_4);
                    };
                    _local_7++;
                };
                _SafeStr_8435.add(_local_5, _local_8);
                _local_5++;
            };
        }


    }
}//package com.sulake.habbo.communication.messages.parser.game.snowwar.data

// _SafeStr_24 = "_-W1s" (String#8725, DoABC#3)
// _SafeStr_6163 = "_-JJ" (String#7798, DoABC#3)
// _SafeStr_8434 = "_-r1C" (String#10117, DoABC#3)
// _SafeStr_8435 = "_-oI" (String#9951, DoABC#3)


