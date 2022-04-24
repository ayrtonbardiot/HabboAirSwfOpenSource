// by nota

//_-Zz._SafeStr_1552

package _-Zz
{
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    [SecureSWF(rename="true")]
    public class _SafeStr_1552 
    {

        private var _SafeStr_4042:int;
        private var _SafeStr_4043:int;
        private var _color:String;
        private var _SafeStr_5919:int;
        private var _SafeStr_7896:int;
        private var _SafeStr_4038:Array;

        public function _SafeStr_1552(_arg_1:IMessageDataWrapper)
        {
            var _local_2:int;
            super();
            _SafeStr_4042 = _arg_1.readInteger();
            _SafeStr_4043 = _arg_1.readInteger();
            _color = _arg_1.readString();
            _SafeStr_5919 = _arg_1.readInteger();
            _SafeStr_4038 = [];
            _SafeStr_7896 = _arg_1.readInteger();
            _local_2 = 0;
            while (_local_2 < _SafeStr_7896)
            {
                _SafeStr_4038.push(_arg_1.readInteger());
                _SafeStr_4038.push(_arg_1.readInteger());
                _SafeStr_4038.push(_arg_1.readInteger());
                _local_2++;
            };
        }

        public function get typeId():int
        {
            return (_SafeStr_4042);
        }

        public function get paletteId():int
        {
            return (_SafeStr_4043);
        }

        public function get color():String
        {
            return (_color);
        }

        public function get breedId():int
        {
            return (_SafeStr_5919);
        }

        public function get figureString():String
        {
            var _local_2:String = ((((typeId + " ") + paletteId) + " ") + color);
            _local_2 = (_local_2 + (" " + customPartCount));
            for each (var _local_1:int in customParts)
            {
                _local_2 = (_local_2 + (" " + _local_1));
            };
            return (_local_2);
        }

        public function get customParts():Array
        {
            return (_SafeStr_4038);
        }

        public function get customPartCount():int
        {
            return (_SafeStr_7896);
        }


    }
}//package _-Zz

// _SafeStr_1552 = "_-JF" (String#7795, DoABC#3)
// _SafeStr_4038 = "_-N1U" (String#8068, DoABC#3)
// _SafeStr_4042 = "_-L1L" (String#7942, DoABC#3)
// _SafeStr_4043 = "_-Ru" (String#8389, DoABC#3)
// _SafeStr_5919 = "_-e1Z" (String#9277, DoABC#3)
// _SafeStr_7896 = "_-7R" (String#7047, DoABC#3)


