//-----------------------------------------------------------------------
//------------------- Copyright (c) samisalreadytaken -------------------
//                       github.com/samisalreadytaken
//- v1.0.0 --------------------------------------------------------------
//
// ::SetPlayerFOV( hPlayer, iFOV, flSpeed = 0 )
//
IncludeScript("vs_library");if(!("SetPlayerFOV"in::getroottable())||typeof::SetPlayerFOV!="function"){local m_list=[];local ENT_SCRIPT=::ENT_SCRIPT;local sc=ENT_SCRIPT.GetScriptScope();sc.m_iLastFOV<-0.0;sc.m_flLastFOVSpeed<-0.0;::SetPlayerFOV<-function(hPlayer,iFOV,flSpeed=0.0):(m_list,ENT_SCRIPT,sc){local hView;if(!hPlayer||hPlayer.GetClassname()!="player")throw"SetPlayerFOV: Invalid source entity";for(local i=m_list.len();i--;){local h=m_list[i];if(h){if(h.GetOwner()==hPlayer){hView=h;break}}else m_list.remove(i)}if(!hView){foreach(h in m_list)if(h)if(!h.GetOwner()){hView=h;break}};if(hView){if(!iFOV){hView.SetFov(0,flSpeed);hView.SetOwner(null);return}}else{hView=::VS.CreateEntity("point_viewcontrol",{spawnflags=(1<<0)|(1<<7)},true);hView.__KeyValueFromInt("effects",1<<5);hView.__KeyValueFromInt("movetype",8);hView.__KeyValueFromInt("renderamt",0);hView.__KeyValueFromInt("rendermode",10);m_list.append(hView.weakref())};sc.m_iLastFOV=iFOV.tointeger();sc.m_flLastFOVSpeed=flSpeed.tofloat();hView.SetOwner(hPlayer);::DoEntFireByInstanceHandle(hView,"enable","",0.0,hPlayer,null);::DoEntFireByInstanceHandle(hView,"disable","",0.0,hPlayer,null);::delay("activator.SetFov(m_iLastFOV,m_flLastFOVSpeed)",0.0,ENT_SCRIPT,hView);return hView}};;
