// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//_-Z1T._SafeStr_923

package _-Z1T
{
    import com.sulake.core.communication.messages.IMessageComposer;

    [SecureSWF(rename="true")]
    public class _SafeStr_923 implements IMessageComposer 
    {

        private var _voteOption:int;

        public function _SafeStr_923(_arg_1:int)
        {
            this._voteOption = _arg_1;
        }

        public function dispose():void
        {
        }

        public function getMessageArray():Array
        {
            return ([_voteOption]);
        }


    }
}//package _-Z1T

// _SafeStr_923 = "_-yO" (String#10631, DoABC#3)


