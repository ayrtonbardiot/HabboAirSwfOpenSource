// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//_-z1k._SafeStr_1298

package _-z1k
{
    import com.sulake.core.communication.messages.IMessageParser;
    import __AS3__.vec.Vector;
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    [SecureSWF(rename="true")]
    public class _SafeStr_1298 implements IMessageParser 
    {

        private var _SafeStr_4318:int;
        private var _SafeStr_7874:Vector.<_SafeStr_1622>;
        private var _SafeStr_7875:String;


        public function flush():Boolean
        {
            _SafeStr_7874 = null;
            return (true);
        }

        public function parse(_arg_1:IMessageDataWrapper):Boolean
        {
            var _local_4:int;
            var _local_2:* = null;
            var _local_6:* = null;
            var _local_5:* = null;
            _SafeStr_4318 = _arg_1.readInteger();
            var _local_3:int = _arg_1.readInteger();
            _SafeStr_7874 = new Vector.<_SafeStr_1622>(0);
            _local_4 = 0;
            while (_local_4 < _local_3)
            {
                _local_2 = _arg_1.readString();
                _local_6 = _arg_1.readString();
                _local_5 = _arg_1.readString();
                _SafeStr_7874.push(new _SafeStr_1622(_local_2, _local_6, _local_5));
                _local_4++;
            };
            _SafeStr_7875 = _arg_1.readString();
            return (true);
        }

        public function get furniId():int
        {
            return (_SafeStr_4318);
        }

        public function get playlists():Vector.<_SafeStr_1622>
        {
            return (_SafeStr_7874);
        }

        public function get selectedPlaylistId():String
        {
            return (_SafeStr_7875);
        }


    }
}//package _-z1k

// _SafeStr_1298 = "_-22K" (String#6665, DoABC#3)
// _SafeStr_1622 = "_-Op" (String#8216, DoABC#3)
// _SafeStr_4318 = "_-9J" (String#7188, DoABC#3)
// _SafeStr_7874 = "_-hI" (String#9492, DoABC#3)
// _SafeStr_7875 = "_-4g" (String#6860, DoABC#3)


