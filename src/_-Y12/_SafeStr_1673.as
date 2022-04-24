// by nota

//_-Y12._SafeStr_1673

package _-Y12
{
    import __AS3__.vec.Vector;
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    [SecureSWF(rename="true")]
    public class _SafeStr_1673 
    {

        private var _SafeStr_7788:Vector.<_SafeStr_1686>;
        private var _SafeStr_5220:String;

        public function _SafeStr_1673(_arg_1:IMessageDataWrapper)
        {
            var _local_3:int;
            super();
            _SafeStr_5220 = _arg_1.readString();
            if (_SafeStr_5220 == "")
            {
                _SafeStr_5220 = null;
            };
            _SafeStr_7788 = new Vector.<_SafeStr_1686>();
            var _local_2:int = _arg_1.readInteger();
            _local_3 = 0;
            while (_local_3 < _local_2)
            {
                _SafeStr_7788.push(new _SafeStr_1686(_arg_1));
                _local_3++;
            };
        }

        public function get productOfferList():Vector.<_SafeStr_1686>
        {
            return (_SafeStr_7788);
        }

        public function get thumbnailUrl():String
        {
            return (_SafeStr_5220);
        }


    }
}//package _-Y12

// _SafeStr_1673 = "_-j14" (String#9584, DoABC#3)
// _SafeStr_1686 = "_-Md" (String#8032, DoABC#3)
// _SafeStr_5220 = "_-kZ" (String#9706, DoABC#3)
// _SafeStr_7788 = "_-4" (String#6795, DoABC#3)


