//
//  Base.swift
//  Collectivity_iOSApp
//
//  Created by Clyde Jackson on 5/21/25.
//

import Foundation
import Observation
import SwiftData

enum categories: String, Codable{
    case Communication = "Communication"
    case Empathy = "Empathy"
    case Awareness = "Self Awareness"
}

enum basicInfo: String, Codable{
    case suggestion = "Suggestion", pros = "Pros", cons = "Cons", funFact = "Fun Fact", journalReflection = "Journal Reflection"
}

//
@Model
class User{
    var navTitle: String = "Collectivity"
    
    var gratificationPrompt: String = GratificationPrompts[0]
    var dailyGratification : [String] = ["","",""]
    
    var reflections: [Reflection] = []
    
    var prompts: [Prompt] = [
        PromptsInformation.filter{$0.category == .Communication}[0],
        PromptsInformation.filter{$0.category == .Awareness}[0],
        PromptsInformation.filter{$0.category == .Empathy}[0]
    ]
    
    var selectedPrompt: categories?
    
   init() {}
    
    func AppT() {
        self.navTitle = "Collectivity"
    }
}



struct Prompt: Identifiable, Codable{
    
    var id: String = UUID().uuidString
    let category: categories
    var isComplete: Bool = false
    let name: String
    var infoArray: [infoStruct]
    //let url: String
    var currentRecording: Recording?
    
    init(category: categories, name: String, infoArray: [infoStruct]) {
        self.category = category
        self.name = name
        self.infoArray = infoArray
       // self.url = "Recording_\(id)_\(category).m4a"
    }
}
@Observable
class infoStruct: Identifiable, Observable, Codable{
    let id: UUID = UUID()
    let nameOfCategory: basicInfo
    let descriptionOfCategory: String
    var isShowing: Bool = false
    
    init(nameOfCategory: basicInfo, descriptionOfCategory: String) {
        self.nameOfCategory = nameOfCategory
        self.descriptionOfCategory = descriptionOfCategory
    }
}

//suggestions: "Try greeting a cashier, barista, or someone in your neighborhood. These are natural, low-pressure situations where greetings are socially expected",
//pros: "Creates a small confidence boost that builds momentum for future interactions Practices initiating conversation without the pressure of maintaining it.",
//cons: "May feel awkward or anxiety-inducing in the moment. Some people might not respond positively, which could feel discouraging",
//funFact: "In parts of the American South, it's considered impolite not to greet strangers you pass on the street. Cultural norms around greeting strangers vary dramatically around the world!")

let PromptsInformation: [Prompt] = [
    Prompt(category: .Communication,
           name: "Say Hello to a stranger today.",
           infoArray: [
            infoStruct(nameOfCategory: .suggestion, descriptionOfCategory: "Try greeting a cashier, barista, or someone in your neighborhood. These are natural, low-pressure situations where greetings are socially expected"),
            infoStruct(nameOfCategory: .pros, descriptionOfCategory: "Creates a small confidence boost that builds momentum for future interactions. Practices initiating conversation without the pressure of maintaining it."),
            infoStruct(nameOfCategory: .cons, descriptionOfCategory: "May feel awkward or anxiety-inducing in the moment. Some people might not respond positively, which could feel discouraging"),
            infoStruct(nameOfCategory: .funFact, descriptionOfCategory: "In parts of the American South, it's considered impolite not to greet strangers you pass on the street. Cultural norms around greeting strangers vary dramatically around the world!"),
            infoStruct(nameOfCategory: .journalReflection, descriptionOfCategory: "How did the person respond to your greeting? Did their response affect how you felt about the encounter? Would you feel comfortable greeting this same type of stranger again tomorrow? Why or why not?")
           ]),
    
    Prompt(category: .Communication,
           name: "Have a 5 minute conversation with a friend or a family member.",
           infoArray: [
            infoStruct(nameOfCategory: .suggestion, descriptionOfCategory: "Focus on asking at least one open-ended question like 'What was the highlight of your day?' or 'What are you looking forward to this week?'"),
            infoStruct(nameOfCategory: .pros, descriptionOfCategory: "Strengthens social bonds through regular connection. Provides practice in a safe environment"),
            infoStruct(nameOfCategory: .cons, descriptionOfCategory: "May trigger anxiety if you're out of practiced about conversation. Can be emotionally taxing when you're not ready"),
            infoStruct(nameOfCategory: .funFact, descriptionOfCategory: "The average person spends about 70-80% of their waking hours engaged in some form of communication!"),
            infoStruct(nameOfCategory: .journalReflection, descriptionOfCategory: "What topics did you discuss? Did you learn anything new about the person? How might you build on this conversation next time?")
           ]),
    
    Prompt(category: .Communication,
           name: "Make a phone call instead of texting",
           infoArray: [
            infoStruct(nameOfCategory: .suggestion, descriptionOfCategory: "Develop comfort with spontaneous conversation. Plan 3-5 talking points beforehand if you're nervous about awkward silences."),
            infoStruct(nameOfCategory: .pros, descriptionOfCategory: "Creates stronger connection through voice tone. Builds real-time conversation skills. Gets it saved."),
            infoStruct(nameOfCategory: .cons, descriptionOfCategory: "Lacks the built-in reflection time that texting provides. May feel more intrusive to the recipient who might be busy"),
            infoStruct(nameOfCategory: .funFact, descriptionOfCategory: "Studies show that hearing a friend's voice actually releases oxytocin (the 'bonding hormone') and lowers stress, creating a physiological connection that texting and emailing simply can't replicate."),
            infoStruct(nameOfCategory: .journalReflection, descriptionOfCategory: "How was the experience different from texting? Were there any unexpected turns in the conversation? What did you? What shifts?")
           ]),
    
    Prompt(category: .Communication,
           name: "Attend a community event",
           infoArray: [
            infoStruct(nameOfCategory: .suggestion, descriptionOfCategory: "Look for smaller events like a book club, workshop, or volunteer-based events that provide clear roles and structured interactions rather than just 'social-time' or 'conversational gaps'"),
            infoStruct(nameOfCategory: .pros, descriptionOfCategory: "Puts you in proximity to others with similar interests. Provides structured activity that reduces pressure and acts as an natural conversation starter"),
            infoStruct(nameOfCategory: .cons, descriptionOfCategory: "May feel overwhelming if the event is large. May seem yourself as actually go to them; has further act of challenge"),
            infoStruct(nameOfCategory: .funFact, descriptionOfCategory: "Community events often function as 'social glue' - from ancient Roman festivals to traditional neighborhood gatherings."),
            infoStruct(nameOfCategory: .journalReflection, descriptionOfCategory: "Did you speak with anyone new? How did you feel while you first arrived compared to when you left? What might make the next community event feel easier?")
           ]),
    
    Prompt(category: .Communication,
           name: "Join a group conversation.",
           infoArray: [
            infoStruct(nameOfCategory: .suggestion, descriptionOfCategory: "When you do contribute, try building on someone else's point, or asking a question about something that interested."),
            infoStruct(nameOfCategory: .pros, descriptionOfCategory: "Requires less pressure to maintain the conversation than show responsibility to dominate. Exposes you to different communication styles and styles of conversation."),
            infoStruct(nameOfCategory: .cons, descriptionOfCategory: "Can be challenging to find the right moment to contribute. Might trigger feelings of being an outsider if unable to find natural entry points in the conversation"),
            infoStruct(nameOfCategory: .funFact, descriptionOfCategory: "Successful group conversations typically have a 3:1 ratio of listening to speaking for each person! Research shows that the most engaging conversationalists are often expert listeners when digital conversation includes or excludes."),
            infoStruct(nameOfCategory: .journalReflection, descriptionOfCategory: "How did you step into the conversation? What helped reduce anxiety? Did you feel included? What would you do differently about next time?")
           ]),
    
    Prompt(category: .Communication,
           name: "Make eye contact and smile with 3 people today",
           infoArray: [
            infoStruct(nameOfCategory: .suggestion, descriptionOfCategory: "Practice with cashiers or baristas since brief eye contact is part of their professional interaction."),
            infoStruct(nameOfCategory: .pros, descriptionOfCategory: "Eye contact is one of the most fundamental aspects of interpersonal connection. Sends positive social signals without requiring verbal response."),
            infoStruct(nameOfCategory: .cons, descriptionOfCategory: "Can feel intensely vulnerable for those with social anxiety or shyness. Cultural norms around eye contact very, and might be misinterpreted (differently)."),
            infoStruct(nameOfCategory: .funFact, descriptionOfCategory: "People can generally sense someone looking at them even first peripheral vision, which explains the common experience of 'feeling' when someone is staring at you."),
            infoStruct(nameOfCategory: .journalReflection, descriptionOfCategory: "How did maintaining eye contact feel? Did anyone smile back? What physical sensations did you notice in your body?")
           ]),
    
    Prompt(category: .Communication,
           name: "Send a voice message.",
           infoArray: [
            infoStruct(nameOfCategory: .suggestion, descriptionOfCategory: "Start with sending a voice message to a close friend rather than \"Hey, how you\" first voice message brief and perhaps mention something specific like how it ended like you fit in."),
            infoStruct(nameOfCategory: .pros, descriptionOfCategory: "Allowing you to re-record if needed. Creates stronger emotional connection than text by sharing your voice and tone instead of emotion"),
            infoStruct(nameOfCategory: .cons, descriptionOfCategory: "May feel self-conscious about how your voice sounds to others. Receivers might be in public places where they can't listen immediately"),
            infoStruct(nameOfCategory: .funFact, descriptionOfCategory: "Voice messages are particularly popular in Latin America, Spain, and the Middle East, where they comprise up to 40% of all digital messaging. Cultural researchers suggest this stems from traditions around storytelling and emphasis on personal connection."),
            infoStruct(nameOfCategory: .journalReflection, descriptionOfCategory: "How did speaking your thoughts differ from typing them? Did you appreciate your own voice connecter?")
           ]),
    
    Prompt(category: .Communication,
           name: "Message someone who you haven't spoken to in a long time.",
           infoArray: [
            infoStruct(nameOfCategory: .suggestion, descriptionOfCategory: "Keep your first message light - 'I saw something that reminded me of you' or mention a specific of your Hope you're doing well! This gives them something specific to respond to"),
            infoStruct(nameOfCategory: .pros, descriptionOfCategory: "Sometimes reconnect that might bring warmth to you both. Practice initiating interaction rather than only responding"),
            infoStruct(nameOfCategory: .cons, descriptionOfCategory: "Triggers uncertainty about whether they'll respond to you respond. Very trigger feelings of guilt or awkwardness about the period lapse."),
            infoStruct(nameOfCategory: .funFact, descriptionOfCategory: "Most people have about 3 intimate relationships, 15 close friends, 50 friends, and 150 acquaintances, showing social networks have many!"),
            infoStruct(nameOfCategory: .journalReflection, descriptionOfCategory: "What made you hesitate to reach out before? How did reconnecting make you feel?")
           ]),
    
    Prompt(category: .Communication,
           name: "Ask for food recommendations.",
           infoArray: [
            infoStruct(nameOfCategory: .suggestion, descriptionOfCategory: "Ask specific questions about what you need: 'Which is best for a first date?' rather better that 'What's good to eat around here?'"),
            infoStruct(nameOfCategory: .pros, descriptionOfCategory: "Most people enjoy being asked for their opinion and expertise. Creates an easy conversation with clear purpose and end point"),
            infoStruct(nameOfCategory: .cons, descriptionOfCategory: "Requires approaching someone you might not know well. You might be yours imposing on someone's time"),
            infoStruct(nameOfCategory: .funFact, descriptionOfCategory: "The 'mere exposure effect' in psychology shows that people tend to feel more positively toward someone after they've been asked for advice or recommendations. This neural response can actually create connection!"),
            infoStruct(nameOfCategory: .journalReflection, descriptionOfCategory: "How helpful was the interaction? Did it lead to any unexpected conversations?")
           ]),
    
    Prompt(category: .Communication,
           name: "Ask for help with a Project.",
           infoArray: [
            infoStruct(nameOfCategory: .suggestion, descriptionOfCategory: "Be specific about what help you need. Reach out to someone specifically for their assistance or advice which tells that you value their opinion or knowledge."),
            infoStruct(nameOfCategory: .pros, descriptionOfCategory: "Enables meaningful collaboration that can strengthen relationships. Acknowledges and values the other person's skills or knowledge."),
            infoStruct(nameOfCategory: .cons, descriptionOfCategory: "Vulnerability of admitting you need assistance. Risk of rejection if the person is too busy or uninterested"),
            infoStruct(nameOfCategory: .funFact, descriptionOfCategory: "Our ability to ask for and provide help as a specialized task gives early humans a crucial survival advantage and shaped the development of complex social structures. We're literally wired for mutual success."),
            infoStruct(nameOfCategory: .journalReflection, descriptionOfCategory: "How did you frame your request? What made this person a good resource to ask?")
           ]),
    
    Prompt(category: .Communication,
           name: "Share Vulnerability.",
           infoArray: [
            infoStruct(nameOfCategory: .suggestion, descriptionOfCategory: "Share something mild rather than your deepest struggle with someone you trust."),
            infoStruct(nameOfCategory: .pros, descriptionOfCategory: "Creates deeper more authentic connections. Relieves the pressure of maintaining a perfect facade"),
            infoStruct(nameOfCategory: .cons, descriptionOfCategory: "Risk of over-sharing with someone who might not be supportive. Potential feelings of regret or exposure after sharing"),
            infoStruct(nameOfCategory: .funFact, descriptionOfCategory: "When one person discloses something personal vulnerability, specifically matches that level of disclosure, creating trust."),
            infoStruct(nameOfCategory: .journalReflection, descriptionOfCategory: "How supported did you feel after sharing? Did opening up strengthen your connection?")
           ]),
    
    Prompt(category: .Communication,
           name: "Navigate a difficult conversation. Address a minor issue or misunderstanding directly with someone rather than avoiding it.",
           infoArray: [
            infoStruct(nameOfCategory: .suggestion, descriptionOfCategory: "Use the 'sandwich approach' to frame your concern with something positive, address your concern specifically and positive. For example: 'I really value our friendship, I felt hurt when [situation] happened, wasn't intentional and I want to make sure we're on the same page'"),
            infoStruct(nameOfCategory: .pros, descriptionOfCategory: "Prevents small issues from growing into bigger problems. Builds respect and trust through honest communication"),
            infoStruct(nameOfCategory: .cons, descriptionOfCategory: "Potential for conflict or emotional intensity during the conversation. Requires managing both your emotions and the other person's reactions"),
            infoStruct(nameOfCategory: .funFact, descriptionOfCategory: "Studies show that workplaces with teams trained in constructive conflict resolution report 43% fewer workplace conflicts overall satisfaction ratings!"),
            infoStruct(nameOfCategory: .journalReflection, descriptionOfCategory: "What made this conversation challenging? What communication techniques helped most?")
           ]),
    
    Prompt(category: .Communication,
           name: "Spend 10 minutes in a public place observing conversations & behaviors.",
           infoArray: [
            infoStruct(nameOfCategory: .suggestion, descriptionOfCategory: "Coffee shops, public parks, or university common areas work well for people watching. Focus on how people use questions, body language, and expressions of interest to maintain engagements."),
            infoStruct(nameOfCategory: .pros, descriptionOfCategory: "Provides learning opportunity without the pressure of participation. Helps notice successful conversation patterns that you can practice"),
            infoStruct(nameOfCategory: .cons, descriptionOfCategory: "May feel related to working out others' conversations. Passive observation alone won't build actual conversational skills"),
            infoStruct(nameOfCategory: .funFact, descriptionOfCategory: "Many introverts are naturally especially if are communication they recognize that listening and observing."),
            infoStruct(nameOfCategory: .journalReflection, descriptionOfCategory: "What patterns did you notice? What communication techniques seemed most effective?")
           ]),
    
    Prompt(category: .Communication,
           name: "Write a brief thank you note to someone who helped you recently.",
           infoArray: [
            infoStruct(nameOfCategory: .suggestion, descriptionOfCategory: "Be specific about what you're thanking them for - and how it impacted you."),
            infoStruct(nameOfCategory: .pros, descriptionOfCategory: "Creates positive feelings for both the sender and recipient. Practices expressing affection clearly in a non-pressure format"),
            infoStruct(nameOfCategory: .cons, descriptionOfCategory: "May feel awkward or overly formal, especially if not common in your circle. Uncertainty about how detailed or emotional to get"),
            infoStruct(nameOfCategory: .funFact, descriptionOfCategory: "Handwritten thank you notes activate the dopamine pathways in gratitude-stronger neural pathways that make gratitude easier and more automatic over time, essentially 'training' your brain to be more appreciative."),
            infoStruct(nameOfCategory: .journalReflection, descriptionOfCategory: "How specific were you able to be about what you appreciated? How did expressing gratitude feel?")
           ]),
    
    Prompt(category: .Communication,
           name: "Invite 1-2 colleagues to join you for a break.",
           infoArray: [
            infoStruct(nameOfCategory: .suggestion, descriptionOfCategory: "Make the invitation specific rather than open ended: 'having which 1-2 people means spend time together. Sydicated than large groups."),
            infoStruct(nameOfCategory: .pros, descriptionOfCategory: "Builds are at workplace relationships in a low-pressure setting. Gets you away from work-focused interactions."),
            infoStruct(nameOfCategory: .cons, descriptionOfCategory: "Risk of rejection if people are too busy to participate. May be challenging or facilitating the initial conversation"),
            infoStruct(nameOfCategory: .funFact, descriptionOfCategory: "Workplace friendships aren't just nice to have - social drinking and friendship their fulfilling break) are workplace enhancing recognizing that strong professional relationships lead to better collaboration."),
            infoStruct(nameOfCategory: .journalReflection, descriptionOfCategory: "What was challenging about taking the initiative? What topics kept the conversation flowing?")
           ]),

    Prompt(category: .Awareness,
           name: "Identify your energy levels in group settings.",
           infoArray: [
            infoStruct(nameOfCategory: .suggestion, descriptionOfCategory: "Pay attention to your energy before, during, and after group interactions. Are you energized or drained? Consider how different groups affect you."),
            infoStruct(nameOfCategory: .pros, descriptionOfCategory: "Helps identify which environments nourish or deplete your energy."),
            infoStruct(nameOfCategory: .cons, descriptionOfCategory: "It may be difficult to remain objective, as feelings of discomfort or social anxiety could skew your perception."),
            infoStruct(nameOfCategory: .funFact, descriptionOfCategory: "Research shows that social environments can impact your mood and energy in different ways depending on whether you are an introvert or extrovert."),
            infoStruct(nameOfCategory: .journalReflection, descriptionOfCategory: "How do you feel after group activities? Does the group dynamic affect your energy positively or negatively?")
           ]),
    
    Prompt(category: .Awareness,
           name: "Ask for feedback on how you come across.",
           infoArray: [
            infoStruct(nameOfCategory: .suggestion, descriptionOfCategory: "Regularly ask people you trust for feedback on your communication style, behavior, and approachability."),
            infoStruct(nameOfCategory: .pros, descriptionOfCategory: "Can help you grow in self-awareness and improve your interpersonal interactions."),
            infoStruct(nameOfCategory: .cons, descriptionOfCategory: "Not everyone will be comfortable giving honest feedback, and it may be difficult to hear."),
            infoStruct(nameOfCategory: .funFact, descriptionOfCategory: "Studies show that receiving constructive feedback is one of the most effective ways to improve performance and emotional intelligence."),
            infoStruct(nameOfCategory: .journalReflection, descriptionOfCategory: "What feedback did you receive? How can you apply it to improve your relationships?")
           ]),
    
    Prompt(category: .Awareness,
           name: "Notice your reaction to group disagreement",
           infoArray: [
            infoStruct(nameOfCategory: .suggestion, descriptionOfCategory: "Observe how you react when there's conflict in a group setting. Do you become defensive, avoid confrontation, or lean in to help resolve issues?"),
            infoStruct(nameOfCategory: .pros, descriptionOfCategory: "Helps develop emotional regulation and conflict resolution skills."),
            infoStruct(nameOfCategory: .cons, descriptionOfCategory: "Conflict can be uncomfortable, and it might be hard to recognize unconscious biases."),
            infoStruct(nameOfCategory: .funFact, descriptionOfCategory: "The ability to manage group disagreement is linked to stronger leadership and team dynamics."),
            infoStruct(nameOfCategory: .journalReflection, descriptionOfCategory: "How did you handle disagreement today? Did you manage it calmly or did you feel defensive?")
           ]),
    
    Prompt(category: .Awareness,
           name: "Identify your role in community spaces",
           infoArray: [
            infoStruct(nameOfCategory: .suggestion, descriptionOfCategory: "Reflect on how you show up in group settings. Are you a leader, follower, mediator, or observer?"),
            infoStruct(nameOfCategory: .pros, descriptionOfCategory: "Understanding your role can help you identify your strengths, engagement and areas for growth."),
            infoStruct(nameOfCategory: .cons, descriptionOfCategory: "Some people might struggle to define their role or may feel insecure about their place in the group."),
            infoStruct(nameOfCategory: .funFact, descriptionOfCategory: "Some people might struggle to define their role or may feel insecure about their place in the group."),
            infoStruct(nameOfCategory: .journalReflection, descriptionOfCategory: "What role do you tend to play in communities? Is this a role you're comfortable with?")
           ]),
    
    Prompt(category: .Awareness,
           name: "Track your listening-to-speaking ratio",
           infoArray: [
            infoStruct(nameOfCategory: .suggestion, descriptionOfCategory: "Pay attention to how much you listen versus how much you speak during conversations. Aim for a healthy balance."),
            infoStruct(nameOfCategory: .pros, descriptionOfCategory: "Can improve communication, strengthen relationships, and enhance empathy."),
            infoStruct(nameOfCategory: .cons, descriptionOfCategory: "May require a conscious effort if you tend to dominate conversations or struggle with silence."),
            infoStruct(nameOfCategory: .funFact, descriptionOfCategory: "Effective listening is considered one of the most important skills for building strong relationships."),
            infoStruct(nameOfCategory: .journalReflection, descriptionOfCategory: "Did you listen more than you spoke today? How did that affect your conversations?")
           ]),
    
    Prompt(category: .Awareness,
           name: "Reflect on who you authentically are in different communities",
           infoArray: [
            infoStruct(nameOfCategory: .suggestion, descriptionOfCategory: "Evaluate if you feel true to yourself in various social settings. Are you showing up as your authentic self, or are you adjusting your behavior?"),
            infoStruct(nameOfCategory: .pros, descriptionOfCategory: "Promotes self-acceptance and encourages authentic connections."),
            infoStruct(nameOfCategory: .cons, descriptionOfCategory: "Some environments might make it challenging to feel completely authentic."),
            infoStruct(nameOfCategory: .funFact, descriptionOfCategory: "Being authentic is associated with greater well-being and mental health."),
            infoStruct(nameOfCategory: .journalReflection, descriptionOfCategory: "Do you feel authentic in different community spaces? What makes you feel aligned or disconnected?")
           ]),
    
    Prompt(category: .Awareness,
           name: "Observe your technology use in social settings",
           infoArray: [
            infoStruct(nameOfCategory: .suggestion, descriptionOfCategory: "Monitor how often you check your phone or other devices during social interactions. Are you present or distracted?"),
            infoStruct(nameOfCategory: .pros, descriptionOfCategory: "Encourages mindfulness and deeper connection in social settings."),
            infoStruct(nameOfCategory: .cons, descriptionOfCategory: "It may be hard to break habits of using technology for comfort or habit."),
            infoStruct(nameOfCategory: .funFact, descriptionOfCategory: "Research suggests that excessive tech use in social settings can reduce relationship satisfaction."),
            infoStruct(nameOfCategory: .journalReflection, descriptionOfCategory: "Did you feel present in your interactions today, or were you distracted by technology?")
           ]),
    
    Prompt(category: .Awareness,
           name: "Notice what triggers comparison in community",
           infoArray: [
            infoStruct(nameOfCategory: .suggestion, descriptionOfCategory: "Be aware of moments when you find yourself comparing your achievements, appearance, or others to community settings."),
            infoStruct(nameOfCategory: .pros, descriptionOfCategory: "Recognizing triggers helps reduce unhealthy comparisons and promotes self-compassion."),
            infoStruct(nameOfCategory: .cons, descriptionOfCategory: "It can be difficult to stop comparing, especially in competitive or judgmental environments."),
            infoStruct(nameOfCategory: .funFact, descriptionOfCategory: "People tend to compare themselves to others as a way of seeking validation, but it often leads to negative feelings."),
            infoStruct(nameOfCategory: .journalReflection, descriptionOfCategory: "What triggered you to compare yourself to others today? How did you shift your perspective?")
           ]),
    
    Prompt(category: .Awareness,
           name: "Identify your values in community participation",
           infoArray: [
            infoStruct(nameOfCategory: .suggestion, descriptionOfCategory: "Reflect on what values drive your participation in community activities. Do you value connection, service, leadership, etc.?"),
            infoStruct(nameOfCategory: .pros, descriptionOfCategory: "Clarifies your motivations, leading to more intentional community involvement."),
            infoStruct(nameOfCategory: .cons, descriptionOfCategory: "It may take time to pinpoint your core values and understand how they influence your actions."),
            infoStruct(nameOfCategory: .funFact, descriptionOfCategory: "People who align their actions with their core values report higher life satisfaction and personal fulfillment."),
            infoStruct(nameOfCategory: .journalReflection, descriptionOfCategory: "What values guide your involvement in community activities? Are they aligned with your actions?")
           ]),
    
    Prompt(category: .Awareness,
           name: "practice recognizing others' emotional state",
           infoArray: [
            infoStruct(nameOfCategory: .suggestion, descriptionOfCategory: "Observe non-verbal cues like body language, facial expressions, and tone of voice to understand how others are."),
            infoStruct(nameOfCategory: .pros, descriptionOfCategory: "Enhances empathy and strengthens relationships."),
            infoStruct(nameOfCategory: .cons, descriptionOfCategory: "Misreading emotional cues is possible, especially in unfamiliar situations."),
            infoStruct(nameOfCategory: .funFact, descriptionOfCategory: "Studies show that emotional intelligence (the ability to recognize others' emotions) is a predictor of success in social and professional settings."),
            infoStruct(nameOfCategory: .journalReflection, descriptionOfCategory: "Did you notice anyone's emotions today? How did you respond to their feelings?")
           ]),
    
    Prompt(category: .Awareness,
           name: "examine your judgment of others",
           infoArray: [
            infoStruct(nameOfCategory: .suggestion, descriptionOfCategory: "Pay attention to when and why you judge others. Reflect on whether your judgments are based on assumptions or facts."),
            infoStruct(nameOfCategory: .pros, descriptionOfCategory: "Helps cultivate more open-mindedness and empathy."),
            infoStruct(nameOfCategory: .cons, descriptionOfCategory: "It may be uncomfortable to acknowledge judgmental thoughts."),
            infoStruct(nameOfCategory: .funFact, descriptionOfCategory: "Non-judgmental thinking is linked to higher levels of emotional well-being."),
            infoStruct(nameOfCategory: .journalReflection, descriptionOfCategory: "When did you judge someone today, and what could you have done differently?")
           ]),
    
    Prompt(category: .Awareness,
           name: "explore your boundaries in community settings",
           infoArray: [
            infoStruct(nameOfCategory: .suggestion, descriptionOfCategory: "Take note of where you set personal boundaries in social or group settings. Do you feel comfortable asserting them?"),
            infoStruct(nameOfCategory: .pros, descriptionOfCategory: "Knowing and maintaining boundaries can prevent burnout and resentment."),
            infoStruct(nameOfCategory: .cons, descriptionOfCategory: "Setting boundaries can sometimes lead to conflict or discomfort."),
            infoStruct(nameOfCategory: .funFact, descriptionOfCategory: "Healthy boundaries are crucial for mental health and sustaining meaningful relationships."),
            infoStruct(nameOfCategory: .journalReflection, descriptionOfCategory: "Did you feel confident in setting your boundaries today? Where could you improve?")
           ]),
    
    Prompt(category: .Awareness,
           name: "notice how you respond to appreciation and criticism",
           infoArray: [
            infoStruct(nameOfCategory: .suggestion, descriptionOfCategory: "Reflect on your emotional response when others express gratitude or offer constructive criticism."),
            infoStruct(nameOfCategory: .pros, descriptionOfCategory: "Awareness helps improve emotional regulation and increases receptiveness to feedback."),
            infoStruct(nameOfCategory: .cons, descriptionOfCategory: "Criticism can feel personal and lead to defensive reactions."),
            infoStruct(nameOfCategory: .funFact, descriptionOfCategory: "People who can accept both appreciation and criticism gracefully tend to have higher levels of emotional intelligence."),
            infoStruct(nameOfCategory: .journalReflection, descriptionOfCategory: "How did you respond to appreciation or criticism today? Was it the response you wanted?")
           ]),
    
    Prompt(category: .Awareness,
           name: "Identify your contribution to community challenges",
           infoArray: [
            infoStruct(nameOfCategory: .suggestion, descriptionOfCategory: "Reflect on how you contribute to challenges in your community, whether intentionally or unintentionally."),
            infoStruct(nameOfCategory: .pros, descriptionOfCategory: "Helps you take responsibility for your impact on the group and fosters accountability."),
            infoStruct(nameOfCategory: .cons, descriptionOfCategory: "It might be hard to admit personal contributions to negative situations."),
            infoStruct(nameOfCategory: .funFact, descriptionOfCategory: "Taking ownership of your actions in a community can strengthen your role as a leader or influencer."),
            infoStruct(nameOfCategory: .journalReflection, descriptionOfCategory: "What challenges in your community were you contributing to? How can you address or resolve them?")
           ]),
    
    Prompt(category: .Awareness,
           name: "reflect on what you need vs. what you give in community",
           infoArray: [
            infoStruct(nameOfCategory: .suggestion, descriptionOfCategory: "Reflect on the balance between what you give and what you receive in your community involvement. Are you?"),
            infoStruct(nameOfCategory: .pros, descriptionOfCategory: "Promotes a healthy balance between self-care and service."),
            infoStruct(nameOfCategory: .cons, descriptionOfCategory: "It might be difficult to admit when you're giving too much or not receiving enough."),
            infoStruct(nameOfCategory: .funFact, descriptionOfCategory: "Studies suggest that reciprocal relationships in communities are more sustainable and fulfilling."),
            infoStruct(nameOfCategory: .journalReflection, descriptionOfCategory: "What do you need more of in your community involvement? Are you giving more than you're receiving?")
           ]),
    
    Prompt(category: .Empathy,
           name: "Imagine their day before they met you.",
           infoArray: [
            infoStruct(nameOfCategory: .suggestion, descriptionOfCategory: "Journal from their view; reflect on their possible morning."),
            infoStruct(nameOfCategory: .pros, descriptionOfCategory: "Builds perspective; expands empathy."),
            infoStruct(nameOfCategory: .cons, descriptionOfCategory: "May feel speculative or awkward."),
            infoStruct(nameOfCategory: .funFact, descriptionOfCategory: "Mirror neurons help us simulate others' feelings."),
            infoStruct(nameOfCategory: .journalReflection, descriptionOfCategory: "What do you notice differently when imagining someone's day?")
           ]),
    
    Prompt(category: .Empathy,
           name: "Ask someone what they wish more people knew about them.",
           infoArray: [
            infoStruct(nameOfCategory: .suggestion, descriptionOfCategory: "Start with a friend or co-worker."),
            infoStruct(nameOfCategory: .pros, descriptionOfCategory: "Deepens connection quickly."),
            infoStruct(nameOfCategory: .cons, descriptionOfCategory: "May be too vulnerable for some."),
            infoStruct(nameOfCategory: .funFact, descriptionOfCategory: "People open up more when asked sincerely."),
            infoStruct(nameOfCategory: .journalReflection, descriptionOfCategory: "How did it feel to ask and listen without interrupting?")
           ]),
    
    Prompt(category: .Empathy,
           name: "Listen without planning your response.",
           infoArray: [
            infoStruct(nameOfCategory: .suggestion, descriptionOfCategory: "Practice 5-minute active listening."),
            infoStruct(nameOfCategory: .pros, descriptionOfCategory: "Builds emotional intelligence."),
            infoStruct(nameOfCategory: .cons, descriptionOfCategory: "Challenging for multitaskers."),
            infoStruct(nameOfCategory: .funFact, descriptionOfCategory: "Listening activates more of your brain than speaking."),
            infoStruct(nameOfCategory: .journalReflection, descriptionOfCategory: "What changed in the conversation when you listened fully?")
           ]),
    
    Prompt(category: .Empathy,
           name: "Describe a time you felt misunderstood.",
           infoArray: [
            infoStruct(nameOfCategory: .suggestion, descriptionOfCategory: "Journal or record a voice note."),
            infoStruct(nameOfCategory: .pros, descriptionOfCategory: "Enhances self-empathy and expression."),
            infoStruct(nameOfCategory: .cons, descriptionOfCategory: "May trigger old emotions."),
            infoStruct(nameOfCategory: .funFact, descriptionOfCategory: "Writing about emotions lowers stress levels."),
            infoStruct(nameOfCategory: .journalReflection, descriptionOfCategory: "What would you want someone to understand about that moment?")
           ]),
    
    Prompt(category: .Empathy,
           name: "Watch a movie from someone else's cultural background.",
           infoArray: [
            infoStruct(nameOfCategory: .suggestion, descriptionOfCategory: "Choose one with subtitles or new perspectives."),
            infoStruct(nameOfCategory: .pros, descriptionOfCategory: "Fun and insightful."),
            infoStruct(nameOfCategory: .cons, descriptionOfCategory: "Not a replacement for real conversation."),
            infoStruct(nameOfCategory: .funFact, descriptionOfCategory: "Stories activate empathy circuits in the brain."),
            infoStruct(nameOfCategory: .journalReflection, descriptionOfCategory: "What did the story teach you about lives different from yours?")
           ]),
    
    Prompt(category: .Empathy,
           name: "Make a 'thank you' list for invisible labor.",
           infoArray: [
            infoStruct(nameOfCategory: .suggestion, descriptionOfCategory: "List unseen roles; thank one person."),
            infoStruct(nameOfCategory: .pros, descriptionOfCategory: "Builds appreciation and awareness."),
            infoStruct(nameOfCategory: .cons, descriptionOfCategory: "Can be easy to forget to follow up."),
            infoStruct(nameOfCategory: .funFact, descriptionOfCategory: "Gratitude improves physical and mental health."),
            infoStruct(nameOfCategory: .journalReflection, descriptionOfCategory: "Who do you take for granted, and why?")
           ]),
    
    Prompt(category: .Empathy,
           name: "Go one day without making assumptions.",
           infoArray: [
            infoStruct(nameOfCategory: .suggestion, descriptionOfCategory: "Notice judgments and reframe them."),
            infoStruct(nameOfCategory: .pros, descriptionOfCategory: "Builds mindfulness and fairness."),
            infoStruct(nameOfCategory: .cons, descriptionOfCategory: "Mentally exhausting at first."),
            infoStruct(nameOfCategory: .funFact, descriptionOfCategory: "You make thousands of unconscious assumptions daily!"),
            infoStruct(nameOfCategory: .journalReflection, descriptionOfCategory: "What surprised you most about your assumptions?")
           ]),
    
    Prompt(category: .Empathy,
           name: "Talk to someone older about their past.",
           infoArray: [
            infoStruct(nameOfCategory: .suggestion, descriptionOfCategory: "Ask about childhood or turning points."),
            infoStruct(nameOfCategory: .pros, descriptionOfCategory: "Builds intergenerational empathy."),
            infoStruct(nameOfCategory: .cons, descriptionOfCategory: "May feel unfamiliar or intimidating."),
            infoStruct(nameOfCategory: .funFact, descriptionOfCategory: "Elders feel more connected when sharing stories."),
            infoStruct(nameOfCategory: .journalReflection, descriptionOfCategory: "What did their story make you reflect on in your own life?")
           ]),
    
    Prompt(category: .Empathy,
           name: "Interpret someone's silence kindly.",
           infoArray: [
            infoStruct(nameOfCategory: .suggestion, descriptionOfCategory: "Assume the best instead of the worst."),
            infoStruct(nameOfCategory: .pros, descriptionOfCategory: "Improves trust and reduces misreads."),
            infoStruct(nameOfCategory: .cons, descriptionOfCategory: "Easy to default to fear or doubt."),
            infoStruct(nameOfCategory: .funFact, descriptionOfCategory: "Silence often means thinking, not judging."),
            infoStruct(nameOfCategory: .journalReflection, descriptionOfCategory: "When did you interpret silence — and how might you reframe it now?")
           ]),
    
    Prompt(category: .Empathy,
           name: "Draw your emotions from someone else's point of view.",
           infoArray: [
            infoStruct(nameOfCategory: .suggestion, descriptionOfCategory: "Use abstract shapes or colors."),
            infoStruct(nameOfCategory: .pros, descriptionOfCategory: "Creative and expressive tool. Expands worldview and empathy."),
            infoStruct(nameOfCategory: .cons, descriptionOfCategory: "May feel awkward for non-artists."),
            infoStruct(nameOfCategory: .funFact, descriptionOfCategory: "Art can express what words can't."),
            infoStruct(nameOfCategory: .journalReflection, descriptionOfCategory: "What did you discover about your emotions when drawing from another's view?")
           ]),
    
    Prompt(category: .Empathy,
           name: "Volunteer for a cause you don't benefit from.",
           infoArray: [
            infoStruct(nameOfCategory: .suggestion, descriptionOfCategory: "Try one hour locally or virtually."),
            infoStruct(nameOfCategory: .pros, descriptionOfCategory: "Volunteering lowers depression risk."),
            infoStruct(nameOfCategory: .cons, descriptionOfCategory: "Requires time and energy."),
            infoStruct(nameOfCategory: .funFact, descriptionOfCategory: "How did it feel to give without expecting anything back?")
           ]),
    
    Prompt(category: .Empathy,
           name: "Ask someone how they recharge emotionally.",
           infoArray: [
            infoStruct(nameOfCategory: .suggestion, descriptionOfCategory: "Try their method once."),
            infoStruct(nameOfCategory: .pros, descriptionOfCategory: "Builds emotional understanding. Helps uncover misunderstandings."),
            infoStruct(nameOfCategory: .cons, descriptionOfCategory: "May not resonate with you."),
            infoStruct(nameOfCategory: .funFact, descriptionOfCategory: "Learning others' coping styles boosts empathy."),
            infoStruct(nameOfCategory: .journalReflection, descriptionOfCategory: "What did you learn about their needs — and yours?")
           ]),
    
    Prompt(category: .Empathy,
           name: "Watch your tone, not just your words.",
           infoArray: [
            infoStruct(nameOfCategory: .suggestion, descriptionOfCategory: "Record and replay your tone."),
            infoStruct(nameOfCategory: .pros, descriptionOfCategory: "Builds people up; makes others feel seen."),
            infoStruct(nameOfCategory: .cons, descriptionOfCategory: "Hard to self-monitor consistently. Requires thoughtfulness and sincerity."),
            infoStruct(nameOfCategory: .funFact, descriptionOfCategory: "Tone affects 90% of how your message is heard."),
            infoStruct(nameOfCategory: .journalReflection, descriptionOfCategory: "When have your words been misread by your tone?")
           ]),
    
    Prompt(category: .Empathy,
           name: "Introduce someone with a positive trait.",
           infoArray: [
            infoStruct(nameOfCategory: .suggestion, descriptionOfCategory: "'This is Sam — they're thoughtful.'"),
            infoStruct(nameOfCategory: .pros, descriptionOfCategory: "Builds people up; makes others feel seen."),
            infoStruct(nameOfCategory: .cons, descriptionOfCategory: "Requires thoughtfulness and sincerity."),
            infoStruct(nameOfCategory: .funFact, descriptionOfCategory: "Compliments activate brain reward systems."),
            infoStruct(nameOfCategory: .journalReflection, descriptionOfCategory: "How did you feel giving or receiving that kind of intro?")
           ]),
    
    Prompt(category: .Empathy,
           name: "Ask, 'What do you need right now?' instead of giving advice.",
           infoArray: [
            infoStruct(nameOfCategory: .suggestion, descriptionOfCategory: "Pause and listen first."),
            infoStruct(nameOfCategory: .pros, descriptionOfCategory: "Empowers others and avoids assumptions."),
            infoStruct(nameOfCategory: .cons, descriptionOfCategory: "Might feel unnatural if you like problem-solving."),
            infoStruct(nameOfCategory: .funFact, descriptionOfCategory: "Listening can slow someone's heart rate."),
            infoStruct(nameOfCategory: .journalReflection, descriptionOfCategory: "How did it feel to ask instead of assume?")
           ]),
    
    Prompt(category: .Empathy,
           name: "Leave an act of kindness a secret.",
           infoArray: [
            infoStruct(nameOfCategory: .suggestion, descriptionOfCategory: "Leave a note or treat anonymously."),
            infoStruct(nameOfCategory: .pros, descriptionOfCategory: "Builds internal motivation. Broadens empathy through stories."),
            infoStruct(nameOfCategory: .cons, descriptionOfCategory: "No external praise or feedback."),
            infoStruct(nameOfCategory: .funFact, descriptionOfCategory: "Secret kindness releases dopamine."),
            infoStruct(nameOfCategory: .journalReflection, descriptionOfCategory: "How did giving secretly shift your focus or feeling?")
           ]),
    
    Prompt(category: .Empathy,
           name: "Read a book or comic from a marginalized voice.",
           infoArray: [
            infoStruct(nameOfCategory: .suggestion, descriptionOfCategory: "Choose a genre you enjoy."),
            infoStruct(nameOfCategory: .pros, descriptionOfCategory: "Increases emotional awareness. Encourages openness and curiosity."),
            infoStruct(nameOfCategory: .cons, descriptionOfCategory: "Might challenge biases. You might guess wrong sometimes."),
            infoStruct(nameOfCategory: .funFact, descriptionOfCategory: "Fiction inspires empathy even more than non-fiction."),
            infoStruct(nameOfCategory: .journalReflection, descriptionOfCategory: "What assumptions were challenged or expanded?")
           ]),
    
    Prompt(category: .Empathy,
           name: "Pause and label someone else's emotion (silently).",
           infoArray: [
            infoStruct(nameOfCategory: .suggestion, descriptionOfCategory: "Use just 1–2 descriptive words."),
            infoStruct(nameOfCategory: .pros, descriptionOfCategory: "Naming emotions makes them less intense."),
            infoStruct(nameOfCategory: .cons, descriptionOfCategory: "Takes humility and practice."),
            infoStruct(nameOfCategory: .funFact, descriptionOfCategory: "Reframing helps the brain find new solutions."),
            infoStruct(nameOfCategory: .journalReflection, descriptionOfCategory: "What did you notice about what someone felt today?")
           ]),
    
    Prompt(category: .Empathy,
           name: "Reframe 'I don't get it' as 'What might I be missing?'",
           infoArray: [
            infoStruct(nameOfCategory: .suggestion, descriptionOfCategory: "Use during disagreements."),
            infoStruct(nameOfCategory: .pros, descriptionOfCategory: "Creates closeness and meaning."),
            infoStruct(nameOfCategory: .cons, descriptionOfCategory: "Can feel emotionally risky."),
            infoStruct(nameOfCategory: .funFact, descriptionOfCategory: "Gratitude boosts bonding hormones like oxytocin."),
            infoStruct(nameOfCategory: .journalReflection, descriptionOfCategory: "When did this shift open up new understanding for you?")
           ]),
    
    Prompt(category: .Empathy,
           name: "Tell someone how they've impacted you.",
           infoArray: [
            infoStruct(nameOfCategory: .suggestion, descriptionOfCategory: "Be specific and short."),
            infoStruct(nameOfCategory: .pros, descriptionOfCategory: "Builds awareness of invisible work."),
            infoStruct(nameOfCategory: .cons, descriptionOfCategory: "May feel overwhelming once noticed."),
            infoStruct(nameOfCategory: .funFact, descriptionOfCategory: "Emotional labor is often unpaid and unrecognized."),
            infoStruct(nameOfCategory: .journalReflection, descriptionOfCategory: "Who has influenced you, and what do they deserve to know?")
           ]),
    
    Prompt(category: .Empathy,
           name: "Spend a day noticing emotional labor around you.",
           infoArray: [
            infoStruct(nameOfCategory: .suggestion, descriptionOfCategory: "Observe others managing emotions; offer help or appreciation."),
            infoStruct(nameOfCategory: .pros, descriptionOfCategory: "Spreads warmth and connection."),
            infoStruct(nameOfCategory: .cons, descriptionOfCategory: "Some may feel awkward or dismiss it."),
            infoStruct(nameOfCategory: .funFact, descriptionOfCategory: "Genuine compliments boost serotonin."),
            infoStruct(nameOfCategory: .journalReflection, descriptionOfCategory: "What new patterns did you notice today?")
           ]),
    
    Prompt(category: .Empathy,
           name: "Compliment a stranger genuinely.",
           infoArray: [
            infoStruct(nameOfCategory: .suggestion, descriptionOfCategory: "Keep it short and kind (e.g., 'Nice energy!')."),
            infoStruct(nameOfCategory: .pros, descriptionOfCategory: "Encourages honesty and depth. Reduces stress and builds empathy."),
            infoStruct(nameOfCategory: .cons, descriptionOfCategory: "Can feel uncomfortable or take time. Frustrating at first in fast-paced life."),
            infoStruct(nameOfCategory: .funFact, descriptionOfCategory: "People open up more when they sense silence."),
            infoStruct(nameOfCategory: .journalReflection, descriptionOfCategory: "How did it feel to compliment without expecting anything back?")
           ]),
    
    Prompt(category: .Empathy,
           name: "Ask someone how they're really doing — and wait.",
           infoArray: [
            infoStruct(nameOfCategory: .suggestion, descriptionOfCategory: "Give space beyond 'I'm fine.'"),
            infoStruct(nameOfCategory: .pros, descriptionOfCategory: "Patience increases resilience and empathy."),
            infoStruct(nameOfCategory: .cons, descriptionOfCategory: "What shifted when you gave space to a real answer?"),
            infoStruct(nameOfCategory: .funFact, descriptionOfCategory: "What did slowing down teach you today?")
           ]),
    
    Prompt(category: .Empathy,
           name: "Try a day of radical patience.",
           infoArray: [
            infoStruct(nameOfCategory: .suggestion, descriptionOfCategory: "Slow down, let others go first, pause responses."),
            infoStruct(nameOfCategory: .pros, descriptionOfCategory: "Builds vulnerability and connection."),
            infoStruct(nameOfCategory: .cons, descriptionOfCategory: "May feel exposed or judged."),
            infoStruct(nameOfCategory: .funFact, descriptionOfCategory: "Admitting mistakes fosters trust."),
            infoStruct(nameOfCategory: .journalReflection, descriptionOfCategory: "How did sharing change your connection with others?")
           ]),
    
    Prompt(category: .Empathy,
           name: "Share a mistake you've made — and what you learned.",
           infoArray: [
            infoStruct(nameOfCategory: .suggestion, descriptionOfCategory: "Be open in conversation or a post."),
            infoStruct(nameOfCategory: .pros, descriptionOfCategory: "Shows care and effort. Lowers defensiveness and blame."),
            infoStruct(nameOfCategory: .cons, descriptionOfCategory: "May mispronounce or forget. Can feel unnatural in heated moments."),
            infoStruct(nameOfCategory: .funFact, descriptionOfCategory: "Language learning improves social bonding."),
            infoStruct(nameOfCategory: .journalReflection, descriptionOfCategory: "How did it feel to speak with someone on their terms?")
           ]),
    
    Prompt(category: .Empathy,
           name: "Learn a few phrases in another person's first language.",
           infoArray: [
            infoStruct(nameOfCategory: .suggestion, descriptionOfCategory: "Start with 'thank you' or 'how are you?'"),
            infoStruct(nameOfCategory: .pros, descriptionOfCategory: "Assuming good intent improves outcomes in conflict."),
            infoStruct(nameOfCategory: .cons, descriptionOfCategory: "What changed when you assumed kindness first?"),
            infoStruct(nameOfCategory: .funFact, descriptionOfCategory: "What did their story awaken in you?")
           ]),
    
    Prompt(category: .Empathy,
           name: "Assume good intent in the next disagreement.",
           infoArray: [
            infoStruct(nameOfCategory: .suggestion, descriptionOfCategory: "Mentally reframe, 'They're trying their best.'"),
            infoStruct(nameOfCategory: .pros, descriptionOfCategory: "Inspires gratitude and empathy."),
            infoStruct(nameOfCategory: .cons, descriptionOfCategory: "Can bring up strong emotions."),
            infoStruct(nameOfCategory: .funFact, descriptionOfCategory: "Mirror neurons activate even when witnessing resilience."),
            infoStruct(nameOfCategory: .journalReflection, descriptionOfCategory: "What did you notice about yourself when you let go of control?")
           ]),
    
    Prompt(category: .Empathy,
           name: "Watch or read about someone overcoming adversity.",
           infoArray: [
            infoStruct(nameOfCategory: .suggestion, descriptionOfCategory: "Choose a true story or memoir."),
            infoStruct(nameOfCategory: .pros, descriptionOfCategory: "Requires mindfulness to remember."),
            infoStruct(nameOfCategory: .cons, descriptionOfCategory: "Small acts of kindness improve happiness."),
            infoStruct(nameOfCategory: .funFact, descriptionOfCategory: "What new joy did you witness through someone else's eyes?")
           ]),
    
    Prompt(category: .Empathy,
           name: "Let someone go first today — in line, conversation, etc.",
           infoArray: [
            infoStruct(nameOfCategory: .suggestion, descriptionOfCategory: "Practice in daily life intentionally."),
            infoStruct(nameOfCategory: .pros, descriptionOfCategory: "Builds humility and care."),
            infoStruct(nameOfCategory: .cons, descriptionOfCategory: "Can feel shallow if rushed."),
            infoStruct(nameOfCategory: .funFact, descriptionOfCategory: "Sharing joy builds stronger bonds."),
            infoStruct(nameOfCategory: .journalReflection, descriptionOfCategory: "")
           ]),
    
    Prompt(category: .Empathy,
           name: "Ask someone what brings them joy.",
           infoArray: [
            infoStruct(nameOfCategory: .suggestion, descriptionOfCategory: "Follow up with curiosity."),
            infoStruct(nameOfCategory: .pros, descriptionOfCategory: "Centers connection in positivity."),
            infoStruct(nameOfCategory: .cons, descriptionOfCategory: ""),
            infoStruct(nameOfCategory: .funFact, descriptionOfCategory: ""),
            infoStruct(nameOfCategory: .journalReflection, descriptionOfCategory: "")
           ])
]

//        suggestions: "Try greeting a cashier, barista, or someone in your neighborhood. These are natural, low-pressure situations where greetings are socially expected",
//        pros: "-Creates a small confidence boost that builds momentum for future interactions Practices initiating conversation without the pressure of maintaining it.",
//        cons: "-May feel awkward or anxiety-inducing in the moment. Some people might not respond positively, which could feel discouraging",
//        funFacts: "In parts of the American South, it's considered impolite not to greet strangers you pass on the street. Cultural norms around greeting strangers vary dramatically around the world!",
//    journalReflectionSuggestions:"How did the person respond to your greeting? Did their response affect how you felt about the interaction? Would you feel comfortable greeting this same type of stranger again tomorrow? Why? or Why not?"),
//    
//    .Communication: DailyPrpompts(
//        suggestions: "Try greeting a cashier, barista, or someone in your neighborhood. These are natural, low-pressure situations where greetings are socially expected",
//        pros: "-Creates a small confidence boost that builds momentum for future interactions Practices initiating conversation without the pressure of maintaining it.",
//        cons: "-May feel awkward or anxiety-inducing in the moment. Some people might not respond positively, which could feel discouraging",
//        funFacts: "In parts of the American South, it's considered impolite not to greet strangers you pass on the street. Cultural norms around greeting strangers vary dramatically around the world!",
//    journalReflectionSuggestions:"How did the person respond to your greeting? Did their response affect how you felt about the interaction? Would you feel comfortable greeting this same type of stranger again tomorrow? Why? or Why not?")

