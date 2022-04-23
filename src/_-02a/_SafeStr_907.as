// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//_-02a._SafeStr_907

package _-02a
{
    import com.sulake.core.communication.messages.IMessageComposer;

    [SecureSWF(rename="true")]
    public class _SafeStr_907 implements IMessageComposer 
    {

        private var _SafeStr_4318:int;
        private var _name:String;

        public function _SafeStr_907(_arg_1:int, _arg_2:String)
        {
            _SafeStr_4318 = _arg_1;
            _name = _arg_2;
        }

        public function getMessageArray():Array
        {
            return ([_SafeStr_4318, _name]);
        }

        public function dispose():void
        {
        }


    }
}//package _-02a

// _SafeStr_4318 = "_-9J" (String#7188, DoABC#3)
// _SafeStr_907 = "_-61Q" (String#6947, DoABC#3)


