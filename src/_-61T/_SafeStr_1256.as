// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//_-61T._SafeStr_1256

package _-61T
{
    import com.sulake.core.communication.messages.IMessageParser;
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    [SecureSWF(rename="true")]
    public class _SafeStr_1256 implements IMessageParser 
    {

        private var _SafeStr_3740:IMessageDataWrapper;
        private var _SafeStr_5259:int;
        private var _SafeStr_4050:int;
        private var _SafeStr_4051:int;
        private var _SafeStr_4525:int;


        public function next():Boolean
        {
            if (_SafeStr_5259 == 0)
            {
                return (false);
            };
            _SafeStr_5259--;
            _SafeStr_4050 = _SafeStr_3740.readByte();
            _SafeStr_4051 = _SafeStr_3740.readByte();
            _SafeStr_4525 = _SafeStr_3740.readShort();
            return (true);
        }

        public function get x():int
        {
            return (_SafeStr_4050);
        }

        public function get y():int
        {
            return (_SafeStr_4051);
        }

        public function get tileHeight():Number
        {
            return (_SafeStr_1324.decodeTileHeight(_SafeStr_4525));
        }

        public function get isStackingBlocked():Boolean
        {
            return (_SafeStr_1324.decodeIsStackingBlocked(_SafeStr_4525));
        }

        public function get isRoomTile():Boolean
        {
            return (_SafeStr_1324.decodeIsRoomTile(_SafeStr_4525));
        }

        public function flush():Boolean
        {
            _SafeStr_5259 = 0;
            _SafeStr_3740 = null;
            return (true);
        }

        public function parse(_arg_1:IMessageDataWrapper):Boolean
        {
            if (_arg_1 == null)
            {
                return (false);
            };
            _SafeStr_3740 = _arg_1;
            _SafeStr_5259 = _arg_1.readByte();
            return (true);
        }


    }
}//package _-61T

// _SafeStr_1256 = "_-kE" (String#9698, DoABC#3)
// _SafeStr_1324 = "_-zy" (String#10702, DoABC#3)
// _SafeStr_3740 = "_-vf" (String#94, DoABC#3)
// _SafeStr_4050 = "_-22N" (String#6666, DoABC#3)
// _SafeStr_4051 = "_-1L" (String#6600, DoABC#3)
// _SafeStr_4525 = "_-8S" (String#7130, DoABC#3)
// _SafeStr_5259 = "_-61s" (String#6975, DoABC#3)


