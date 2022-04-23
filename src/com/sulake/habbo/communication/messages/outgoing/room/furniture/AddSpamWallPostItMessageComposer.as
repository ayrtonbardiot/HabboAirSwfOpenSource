// by nota
package com.sulake.habbo.communication.messages.outgoing.room.furniture
{
    import com.sulake.core.communication.messages.IMessageComposer;

    [SecureSWF(rename="true")]
    public class AddSpamWallPostItMessageComposer implements IMessageComposer 
    {

        private var _itemId:int;
        private var _location:String;
        private var _colorHex:String;
        private var _message:String;

        public function AddSpamWallPostItMessageComposer(_arg_1:int, _arg_2:String, _arg_3:String, _arg_4:String)
        {
            _itemId = _arg_1;
            _location = _arg_2;
            _colorHex = _arg_3;
            _message = _arg_4;
        }

        public function dispose():void
        {
        }

        public function getMessageArray():Array
        {
            return ([_itemId, _location, _colorHex, _message]);
        }


    }
}

