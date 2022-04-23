// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//_-Po._SafeStr_1016

package _-Po
{
    import com.sulake.core.communication.messages.IMessageComposer;
    import com.sulake.core.runtime._SafeStr_13;

    [SecureSWF(rename="true")]
    public class _SafeStr_1016 implements IMessageComposer, _SafeStr_13 
    {

        private var _SafeStr_7501:Array = [];
        private var _msg:String;

        public function _SafeStr_1016(_arg_1:String)
        {
            this._msg = _arg_1;
        }

        public function getMessageArray():Array
        {
            var _local_2:int;
            var _local_1:Array = [];
            _local_1.push(this._SafeStr_7501.length);
            _local_2 = 0;
            while (_local_2 < this._SafeStr_7501.length)
            {
                _local_1.push(this._SafeStr_7501[_local_2]);
                _local_2++;
            };
            _local_1.push(this._msg);
            return (_local_1);
        }

        public function addInvitedFriend(_arg_1:int):void
        {
            this._SafeStr_7501.push(_arg_1);
        }

        public function dispose():void
        {
            this._SafeStr_7501 = null;
        }

        public function get disposed():Boolean
        {
            return (false);
        }


    }
}//package _-Po

// _SafeStr_1016 = "_-w1U" (String#10454, DoABC#3)
// _SafeStr_13 = "_-P1N" (String#8235, DoABC#3)
// _SafeStr_7501 = "_-X1T" (String#8777, DoABC#3)


