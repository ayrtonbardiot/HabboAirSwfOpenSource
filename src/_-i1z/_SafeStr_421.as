// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//_-i1z._SafeStr_421

package _-i1z
{
    import com.sulake.core.communication.messages.IMessageComposer;

    [SecureSWF(rename="true")]
    public class _SafeStr_421 implements IMessageComposer 
    {

        private var _SafeStr_6600:Array = [];

        public function _SafeStr_421(_arg_1:String)
        {
            this._SafeStr_6600.push(_arg_1);
        }

        public function getMessageArray():Array
        {
            return (this._SafeStr_6600);
        }

        public function dispose():void
        {
            this._SafeStr_6600 = null;
        }

        public function get disposed():Boolean
        {
            return (false);
        }


    }
}//package _-i1z

// _SafeStr_421 = "_-R4" (String#8361, DoABC#3)
// _SafeStr_6600 = "_-91h" (String#56, DoABC#3)


