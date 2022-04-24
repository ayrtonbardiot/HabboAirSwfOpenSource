// by nota

//HabboAirMain

package 
{
    import flash.display.Sprite;
    import com.sulake.core.runtime._SafeStr_35;
    import flash.utils.Dictionary;
    import flash.utils.getQualifiedClassName;
    import com.sulake.core._SafeStr_79;
    import com.sulake.core.utils.ErrorReportStorage;
    import flash.events.Event;
    import flash.desktop.NativeApplication;
    import flash.system.Capabilities;
    import com.sulake.core.runtime._SafeStr_800;
    import com.sulake.air.FileProxy;
    import com.sulake.habbo.utils._SafeStr_472;
    import com.sulake.air.NativeApplicationProxy;
    import flash.events.ProgressEvent;
    import flash.external.ExternalInterface;
    import flash.system.System;
    import com.sulake.core.runtime.IID;
    import com.sulake.iid.IIDHabboLocalizationManager;
    import com.sulake.core.runtime._SafeStr_20;
    import com.sulake.iid.IIDHabboConfigurationManager;
    import com.sulake.iid.IIDRoomEngine;
    import flash.utils.setInterval;
    import com.sulake.habbo.utils.HabboWebTools;

    [SecureSWF(rename="false")]
    public class HabboAirMain extends Sprite 
    {

        public static const CORE_RATIO:Number = 0.6;
        private static const INIT_STEPS:int = 3;

        private var _core:_SafeStr_35;
        private var _loadingScreen:IHabboLoadingScreen;
        private var _SafeStr_3692:int = 3;
        private var _SafeStr_3691:int = 0;
        private var _completedInitSteps:int = 0;
        private var _SafeStr_3689:Boolean = false;
        private var _SafeStr_3690:Boolean = false;
        private var _SafeStr_3522:Dictionary;
        private var _prepareCoreOnNextFrame:Boolean;

        public function HabboAirMain(_arg_1:IHabboLoadingScreen, _arg_2:Dictionary)
        {
            _loadingScreen = _arg_1;
            _SafeStr_3522 = _arg_2;
            addEventListener("addedToStage", onAddedToStage);
            addEventListener("exitFrame", onExitFrame);
            _SafeStr_14.log(((getQualifiedClassName(_SafeStr_79) + " version: ") + _SafeStr_79.version));
        }

        private function dispose():void
        {
            removeEventListener("progress", onProgressEvent);
            removeEventListener("complete", onCompleteEvent);
            removeEventListener("addedToStage", onAddedToStage);
            removeEventListener("exitFrame", onExitFrame);
            if (_loadingScreen)
            {
                _loadingScreen.dispose();
                _loadingScreen = null;
            };
            if (_core != null)
            {
                _core.events.removeEventListener("COMPONENT_EVENT_RUNNING", onCoreRunning);
            };
            if (parent)
            {
                parent.removeChild(this);
            };
        }

        public function unloading():void
        {
            try
            {
                if (((_core) && (!(_core.disposed))))
                {
                    ErrorReportStorage.addDebugData("Unload", "Client unloading started");
                    _core.events.dispatchEvent(new Event("unload"));
                };
            }
            catch(error:Error)
            {
            };
        }

        protected function onAddedToStage(_arg_1:Event=null):void
        {
            var _local_3:XML = NativeApplication.nativeApplication.applicationDescriptor;
            var _local_5:Namespace = _local_3.namespace();
            var _local_2:String = _local_3._local_5::copyright;
            var _local_4:String = _local_3._local_5::versionLabel;
            var _local_6:String = _local_3._local_5::versionNumber;
            _SafeStr_14.log(("AIR Runtime version: " + NativeApplication.nativeApplication.runtimeVersion));
            _SafeStr_14.log(("Application ID: " + NativeApplication.nativeApplication.applicationID));
            _SafeStr_14.log(("Copyright: " + _local_2));
            _SafeStr_14.log(("Version: " + _local_4));
            _SafeStr_14.log(("VersionNumber: " + _local_6));
            try
            {
                init();
            }
            catch(error:Error)
            {
                HabboAir.trackLoginStep("client.init.core.fail");
                HabboAir.reportCrash(("Failed to prepare the core: " + error.message), 10, true, error);
                _SafeStr_79.dispose();
            };
        }

        private function init():void
        {
            var _local_4:* = null;
            var _local_1:* = null;
            var _local_3:* = null;
            var _local_2:String = Capabilities.version.toLowerCase();
            if (((_local_2.indexOf("win") > -1) || (_local_2.indexOf("mac") > -1)))
            {
            };
            _prepareCoreOnNextFrame = true;
        }

        protected function onExitFrame(_arg_1:Event=null):void
        {
            if (_prepareCoreOnNextFrame)
            {
                _prepareCoreOnNextFrame = false;
                prepareCore();
                return;
            };
            if (((_SafeStr_3689) && (_SafeStr_3690)))
            {
                dispose();
            };
        }

        private function prepareCore():void
        {
            var _local_1:* = null;
            var _local_2:* = null;
            try
            {
                _local_1 = ((Capabilities.playerType != "StandAlone") ? new HabboCoreErrorReporter() : null);
                _core = _SafeStr_79.instantiate(stage, 1, _local_1, _SafeStr_3522);
                _core.events.addEventListener("COMPONENT_EVENT_ERROR", onCoreError);
                _core.events.addEventListener("COMPONENT_EVENT_REBOOT", onCoreReboot);
                _core.prepareComponent(HabboTrackingLib);
                addEventListener("progress", onProgressEvent);
                addEventListener("complete", onCompleteEvent);
                _local_2 = <config>
					<asset-libraries>
						<library url="hh_human_body.swf"/>
						<library url="hh_human_item.swf"/>
					</asset-libraries>
					<service-libraries/>
					<component-libraries/>
				</config>
                ;
                _local_2 = new XML();
                _core.readConfigDocument(_local_2, this);
                (_core as _SafeStr_800).fileProxy = new FileProxy();
                if (_SafeStr_472.nativeApplicationProxy)
                {
                    _SafeStr_472.nativeApplicationProxy.dispose();
                };
                _SafeStr_472.nativeApplicationProxy = new NativeApplicationProxy();
                _SafeStr_3692 = ((_core.getNumberOfFilesPending() + _core.getNumberOfFilesLoaded()) + 3);
                _core.prepareComponent(CoreCommunicationFrameworkLib);
                _core.prepareComponent(HabboRoomObjectLogicLib);
                _core.prepareComponent(HabboRoomObjectVisualizationLib);
                _core.prepareComponent(RoomManagerLib);
                _core.prepareComponent(RoomSpriteRendererLib);
                _core.prepareComponent(HabboRoomSessionManagerLib);
                _core.prepareComponent(HabboAvatarRenderLib);
                _core.prepareComponent(HabboSessionDataManagerLib);
                _core.prepareComponent(HabboConfigurationCom);
                _core.prepareComponent(HabboLocalizationCom);
                _core.prepareComponent(HabboWindowManagerCom);
                _core.prepareComponent(HabboCommunicationCom);
                _core.prepareComponent(HabboCommunicationDemoCom);
                _core.prepareComponent(HabboNavigatorCom);
                _core.prepareComponent(HabboFriendListCom);
                _core.prepareComponent(HabboMessengerCom);
                _core.prepareComponent(HabboInventoryCom);
                _core.prepareComponent(HabboToolbarCom);
                _core.prepareComponent(HabboCatalogCom);
                _core.prepareComponent(HabboRoomEngineCom);
                _core.prepareComponent(HabboRoomUICom);
                _core.prepareComponent(HabboAvatarEditorCom);
                _core.prepareComponent(HabboNotificationsCom);
                _core.prepareComponent(HabboHelpCom);
                _core.prepareComponent(HabboAdManagerCom);
                _core.prepareComponent(HabboModerationCom);
                _core.prepareComponent(HabboUserDefinedRoomEventsCom);
                _core.prepareComponent(HabboSoundManagerFlash10Com);
                _core.prepareComponent(HabboQuestEngineCom);
                _core.prepareComponent(HabboFriendBarCom);
                _core.prepareComponent(HabboGroupsCom);
                _core.prepareComponent(HabboGamesCom);
                _core.prepareComponent(HabboFreeFlowChatCom);
                _core.prepareComponent(HabboNewNavigatorCom);
                addInitializationProgressListeners();
            }
            catch(error:Error)
            {
                _SafeStr_79.dispose();
            };
        }

        private function updateProgressBar():void
        {
            var _local_1:Number;
            if (_loadingScreen != null)
            {
                _local_1 = (0.6 + (((_completedInitSteps + _SafeStr_3691) / _SafeStr_3692) * (1 - 0.6)));
                _loadingScreen.updateLoadingBar(_local_1);
            };
        }

        private function onProgressEvent(_arg_1:ProgressEvent):void
        {
            _SafeStr_3691 = _core.getNumberOfFilesLoaded();
            updateProgressBar();
        }

        private function onCompleteEvent(_arg_1:Event):void
        {
            removeEventListener("progress", onProgressEvent);
            removeEventListener("complete", onCompleteEvent);
            initializeCore();
        }

        private function initializeCore():void
        {
            HabboAir.trackLoginStep("client.init.core.init");
            try
            {
                _core.initialize();
                if (ExternalInterface.available)
                {
                    ExternalInterface.addCallback("unloading", unloading);
                };
            }
            catch(error:Error)
            {
                HabboAir.trackLoginStep("client.init.core.fail");
                _SafeStr_79.crash(("Failed to initialize the core: " + error.message), 10, error);
            };
        }

        public function onCoreError(_arg_1:Event):void
        {
            _SafeStr_14.log(("onCoreError " + _arg_1.type));
        }

        private function onCoreReboot(_arg_1:Event):void
        {
            _SafeStr_14.log(("Reboot application! " + System.privateMemory), System.totalMemory, System.totalMemoryNumber);
            _core.events.removeEventListener("COMPONENT_EVENT_ERROR", onCoreError);
            _core.events.removeEventListener("COMPONENT_EVENT_REBOOT", onCoreReboot);
            _SafeStr_79.dispose();
            _core = null;
            _SafeStr_14.log(("Application ready for restart! " + System.privateMemory), System.totalMemory, System.totalMemoryNumber);
            NativeApplication.nativeApplication.exit(1);
        }

        private function simpleQueueInterface(_arg_1:IID, _arg_2:Function):void
        {
            var _local_3:Object = _core.queueInterface(_arg_1, _arg_2);
            if (_local_3 != null)
            {
                (_arg_2(_arg_1, _local_3));
            };
        }

        private function addInitializationProgressListeners():void
        {
            simpleQueueInterface(new IIDHabboLocalizationManager(), function (_arg_1:IID, _arg_2:_SafeStr_20):void
            {
                _arg_2.events.addEventListener("complete", onLocalizationComplete);
            });
            simpleQueueInterface(new IIDHabboConfigurationManager(), onConfigurationComplete);
            simpleQueueInterface(new IIDRoomEngine(), function (_arg_1:IID, _arg_2:_SafeStr_20):void
            {
                _arg_2.events.addEventListener("REE_ENGINE_INITIALIZED", onRoomEngineReady);
            });
            _core.events.addEventListener("COMPONENT_EVENT_RUNNING", onCoreRunning);
        }

        private function onLocalizationComplete(_arg_1:Event):void
        {
            HabboAir.trackLoginStep("client.init.localization.loaded");
            _completedInitSteps++;
            updateProgressBar();
        }

        private function onConfigurationComplete(_arg_1:IID, _arg_2:_SafeStr_20):void
        {
            HabboAir.trackLoginStep("client.init.config.loaded");
            _completedInitSteps++;
            updateProgressBar();
        }

        private function onRoomEngineReady(_arg_1:Event):void
        {
            _SafeStr_3689 = true;
            HabboAir.trackLoginStep("client.init.room.ready");
            if (_core.getInteger("spaweb", 0) == 1)
            {
                startSendingHeartBeat();
            };
        }

        private function startSendingHeartBeat():void
        {
            sendHeartBeat();
            setInterval(sendHeartBeat, 10000); //not popped
        }

        private function sendHeartBeat():void
        {
            HabboWebTools.sendHeartBeat();
        }

        private function onCoreRunning(_arg_1:Event):void
        {
            _SafeStr_3690 = true;
            HabboAir.trackLoginStep("client.init.core.running");
            _completedInitSteps++;
            updateProgressBar();
        }


    }
}//package 

import com.sulake.core.runtime._SafeStr_489;
import com.sulake.core.runtime._SafeStr_15;

class HabboCoreErrorReporter implements _SafeStr_489 
{

    /*private*/ var _logger:_SafeStr_15;


    public function logError(_arg_1:String, _arg_2:Boolean, _arg_3:int=-1, _arg_4:Error=null):void
    {
        HabboAir.reportCrash(_arg_1, _arg_3, _arg_2, _arg_4, _logger);
    }

    public function set errorLogger(_arg_1:_SafeStr_15):void
    {
        _logger = _arg_1;
    }


}


// _SafeStr_14 = "_-ED" (String#155, DoABC#4)
// _SafeStr_15 = "_-11j" (String#30969, DoABC#4)
// _SafeStr_20 = "_-W1o" (String#542, DoABC#4)
// _SafeStr_35 = "_-wP" (String#23060, DoABC#4)
// _SafeStr_3522 = "_-J1b" (String#22222, DoABC#4)
// _SafeStr_3689 = "_-XZ" (String#19193, DoABC#4)
// _SafeStr_3690 = "_-v1o" (String#20367, DoABC#4)
// _SafeStr_3691 = "_-h8" (String#19136, DoABC#4)
// _SafeStr_3692 = "_-Ww" (String#19168, DoABC#4)
// _SafeStr_472 = "_-dx" (String#24366, DoABC#4)
// _SafeStr_489 = "_-nI" (String#29090, DoABC#4)
// _SafeStr_79 = "_-411" (String#2835, DoABC#4)
// _SafeStr_800 = "_-t11" (String#28496, DoABC#4)


