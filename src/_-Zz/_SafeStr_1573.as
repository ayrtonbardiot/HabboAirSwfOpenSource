// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//_-Zz._SafeStr_1573

package _-Zz
{
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    [SecureSWF(rename="true")]
    public class _SafeStr_1573 
    {

        private var _SafeStr_3820:int;
        private var _name:String;
        private var _SafeStr_4851:_SafeStr_1552;
        private var _SafeStr_3623:int;

        public function _SafeStr_1573(_arg_1:IMessageDataWrapper)
        {
            _SafeStr_3820 = _arg_1.readInteger();
            _name = _arg_1.readString();
            _SafeStr_4851 = new _SafeStr_1552(_arg_1);
            _SafeStr_3623 = _arg_1.readInteger();
        }

        public function get id():int
        {
            return (_SafeStr_3820);
        }

        public function get name():String
        {
            return (_name);
        }

        public function get typeId():int
        {
            return (_SafeStr_4851.typeId);
        }

        public function get paletteId():int
        {
            return (_SafeStr_4851.paletteId);
        }

        public function get color():String
        {
            return (_SafeStr_4851.color);
        }

        public function get breedId():int
        {
            return (_SafeStr_4851.breedId);
        }

        public function get customPartCount():int
        {
            return (_SafeStr_4851.customPartCount);
        }

        public function get figureString():String
        {
            return (_SafeStr_4851.figureString);
        }

        public function get figureData():_SafeStr_1552
        {
            return (_SafeStr_4851);
        }

        public function get level():int
        {
            return (_SafeStr_3623);
        }


    }
}//package _-Zz

// _SafeStr_1552 = "_-JF" (String#7795, DoABC#3)
// _SafeStr_1573 = "_-iW" (String#9562, DoABC#3)
// _SafeStr_3623 = "_-OF" (String#8175, DoABC#3)
// _SafeStr_3820 = "_-t1q" (String#10263, DoABC#3)
// _SafeStr_4851 = "_-W1C" (String#8668, DoABC#3)


