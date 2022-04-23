// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//_-XO._SafeStr_296

package _-XO
{
    import com.sulake.core.communication.messages.IMessageComposer;

    [SecureSWF(rename="true")]
    public class _SafeStr_296 implements IMessageComposer 
    {

        private var _name:String;
        private var _SafeStr_4028:int;

        public function _SafeStr_296(_arg_1:String, _arg_2:int)
        {
            _name = _arg_1;
            _SafeStr_4028 = _arg_2;
        }

        public function getMessageArray():Array
        {
            return ([_name, _SafeStr_4028]);
        }

        public function dispose():void
        {
        }


    }
}//package _-XO

// _SafeStr_296 = "_-r16" (String#10113, DoABC#3)
// _SafeStr_4028 = "_-81R" (String#7081, DoABC#3)


