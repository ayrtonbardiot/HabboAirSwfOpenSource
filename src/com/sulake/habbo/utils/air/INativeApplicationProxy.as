// by nota

//com.sulake.habbo.utils.air.INativeApplicationProxy

package com.sulake.habbo.utils.air
{
    import flash.events.IEventDispatcher;

    public /*dynamic*/ interface INativeApplicationProxy extends IEventDispatcher 
    {

        function dispose():void;
        function allowBackgroundExecution(_arg_1:Boolean):void;

    }
}//package com.sulake.habbo.utils.air

