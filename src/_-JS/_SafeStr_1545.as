// by nota

//_-JS._SafeStr_1545

package _-JS
{
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    [SecureSWF(rename="true")]
    public class _SafeStr_1545 
    {

        private var _SafeStr_3820:int;
        private var _name:String;

        public function _SafeStr_1545(_arg_1:IMessageDataWrapper)
        {
            this._SafeStr_3820 = _arg_1.readInteger();
            this._name = _arg_1.readString();
        }

        public function get id():int
        {
            return (_SafeStr_3820);
        }

        public function get name():String
        {
            return (_name);
        }


    }
}//package _-JS

// _SafeStr_1545 = "_-h1b" (String#9474, DoABC#3)
// _SafeStr_3820 = "_-t1q" (String#10263, DoABC#3)


