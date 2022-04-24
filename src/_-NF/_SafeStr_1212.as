// by nota

//_-NF._SafeStr_1212

package _-NF
{
    import com.sulake.core.communication.messages.IMessageParser;
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    [SecureSWF(rename="true")]
    public class _SafeStr_1212 implements IMessageParser 
    {

        private var _SafeStr_7173:int;
        private var _SafeStr_3820:int;
        private var _newName:String;


        public function get webId():int
        {
            return (_SafeStr_7173);
        }

        public function get id():int
        {
            return (_SafeStr_3820);
        }

        public function get newName():String
        {
            return (_newName);
        }

        public function flush():Boolean
        {
            _SafeStr_7173 = -1;
            _SafeStr_3820 = -1;
            _newName = "";
            return (true);
        }

        public function parse(_arg_1:IMessageDataWrapper):Boolean
        {
            _SafeStr_7173 = _arg_1.readInteger();
            _SafeStr_3820 = _arg_1.readInteger();
            _newName = _arg_1.readString();
            return (true);
        }


    }
}//package _-NF

// _SafeStr_1212 = "_-i1F" (String#9524, DoABC#3)
// _SafeStr_3820 = "_-t1q" (String#10263, DoABC#3)
// _SafeStr_7173 = "_-QV" (String#8321, DoABC#3)


