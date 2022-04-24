// by nota

package com.sulake.habbo.communication.messages.outgoing.room.furniture-02a-02a-02a
{
    import com.sulake.core.communication.messages.IMessageComposer;

    [SecureSWF(rename="true")]
    public class CreditFurniRedeemMessageComposer implements IMessageComposer 
    {

        private var _objectId:int;

        public function CreditFurniRedeemMessageComposer(_arg_1:int)
        {
            _objectId = _arg_1;
        }

        public function dispose():void
        {
        }

        public function getMessageArray():Array
        {
            return ([_objectId]);
        }


    }
}//package com.sulake.habbo.communication.messages.outgoing.room.furniture-02a

// _SafeStr_4157 = "_-G8" (String#7620, DoABC#3)
// _SafeStr_992 = "_-R1z" (String#8360, DoABC#3)


