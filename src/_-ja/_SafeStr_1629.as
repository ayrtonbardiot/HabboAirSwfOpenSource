// by nota

//_-Ja._SafeStr_1629

package _-Ja
{
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    [SecureSWF(rename="true")]
    public class _SafeStr_1629 
    {

        private var _SafeStr_7310:int;
        private var _SafeStr_7311:String;
        private var _SafeStr_4426:Boolean;
        private var _SafeStr_7312:Boolean;
        private var _SafeStr_7313:String;
        private var _SafeStr_7314:String;
        private var _SafeStr_7315:Boolean;

        public function _SafeStr_1629(_arg_1:IMessageDataWrapper)
        {
            _SafeStr_7310 = _arg_1.readInteger();
            _SafeStr_7311 = _arg_1.readString();
            _SafeStr_4426 = _arg_1.readBoolean();
            _SafeStr_7312 = _arg_1.readBoolean();
            _SafeStr_7313 = _arg_1.readString();
            _SafeStr_7314 = _arg_1.readString();
            _SafeStr_7315 = _arg_1.readBoolean();
        }

        public function get nodeId():int
        {
            return (_SafeStr_7310);
        }

        public function get nodeName():String
        {
            return (_SafeStr_7311);
        }

        public function get visible():Boolean
        {
            return (_SafeStr_4426);
        }

        public function get automatic():Boolean
        {
            return (_SafeStr_7312);
        }

        public function get staffOnly():Boolean
        {
            return (_SafeStr_7315);
        }

        public function get automaticCategoryKey():String
        {
            return (_SafeStr_7313);
        }

        public function get globalCategoryKey():String
        {
            return (_SafeStr_7314);
        }

        public function get visibleName():String
        {
            return ((_SafeStr_7314 == "") ? _SafeStr_7311 : (("${navigator.flatcategory.global." + _SafeStr_7314) + "}"));
        }


    }
}//package _-Ja

// _SafeStr_1629 = "_-K0" (String#7859, DoABC#3)
// _SafeStr_4426 = "_-c1l" (String#9123, DoABC#3)
// _SafeStr_7310 = "_-if" (String#9568, DoABC#3)
// _SafeStr_7311 = "_-l1r" (String#9757, DoABC#3)
// _SafeStr_7312 = "_-n1Q" (String#9876, DoABC#3)
// _SafeStr_7313 = "_-32Y" (String#6750, DoABC#3)
// _SafeStr_7314 = "_-S1S" (String#8410, DoABC#3)
// _SafeStr_7315 = "_-K1D" (String#7866, DoABC#3)


