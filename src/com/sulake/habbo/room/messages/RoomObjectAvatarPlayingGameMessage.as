﻿// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//com.sulake.habbo.room.messages.RoomObjectAvatarPlayingGameMessage

package com.sulake.habbo.room.messages
{
    public class RoomObjectAvatarPlayingGameMessage extends RoomObjectUpdateStateMessage 
    {

        private var _isPlayingGame:Boolean;

        public function RoomObjectAvatarPlayingGameMessage(_arg_1:Boolean=false)
        {
            _isPlayingGame = _arg_1;
        }

        public function get isPlayingGame():Boolean
        {
            return (_isPlayingGame);
        }


    }
}//package com.sulake.habbo.room.messages

