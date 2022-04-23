// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//com.sulake.habbo.room.object.visualization.avatar.additions.IAvatarAddition

package com.sulake.habbo.room.object.visualization.avatar.additions
{
    import com.sulake.core.runtime._SafeStr_13;
    import com.sulake.room.object.visualization.IRoomObjectSprite;

    public /*dynamic*/ interface IAvatarAddition extends _SafeStr_13 
    {

        function get id():int;
        function update(_arg_1:IRoomObjectSprite, _arg_2:Number):void;
        function animate(_arg_1:IRoomObjectSprite):Boolean;

    }
}//package com.sulake.habbo.room.object.visualization.avatar.additions

// _SafeStr_13 = "_-P1N" (String#326, DoABC#4)


