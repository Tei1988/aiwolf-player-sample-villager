# frozen_string_literal: true

require 'bundler'
Bundler.require

class SampleVillager < Aiwolf::Client
  def command_initialize(game_info, game_setting)
    logger.info('Game Start')

    agent_id = game_info[:agent]
    role_name = game_info[:roleMap][agent_id.to_s.to_sym]
    unless role_name == 'VILLAGER'
      logger.error('I can not perform any role except VILLAGER')
      raise NotImplementedError
    end

    update_brain(game_info)
  end

  def command_role
    'VILLAGER'
  end

  def command_name
    FFaker::Name.name
  end

  def command_daily_initialize(game_info)
    update_brain(game_info) unless game_info.nil?
  end

  def command_daily_finish(game_info)
    update_brain(game_info) unless game_info.nil?
  end

  def command_talk(talk_history)
    @vote_candidate_agent_id = choose_vote_candidate(talk_history) unless talk_history.nil?
    'Skip'
  end

  def command_vote(game_info)
    { agentIdx: @vote_candidate_agent_id }
  end

  def command_finish(game_info)
    logger.info('Game End')
  end

  def command_attack(game_info)
    raise NotImplementedError
  end

  def command_whisper(game_info)
    raise NotImplementedError
  end

  def command_divine(game_info)
    raise NotImplementedError
  end

  def command_guard(game_info)
    raise NotImplementedError
  end

  private

  def update_brain(game_info)
    @agent_id = game_info[:agent]
    agent_id_in_sym = @agent_id.to_s.to_sym
    @alives = game_info[:statusMap]
                .select { |k, v| k != agent_id_in_sym && v == 'ALIVE' }
                .map { |(k, _v)| k.to_s.to_i }
    @deads = game_info[:statusMap]
                .select { |k, v| k != agent_id_in_sym && v == 'DEAD' }
                .map { |(k, _v)| k.to_s.to_i }
    logger.debug("ALIVES: #{@alives}")
    logger.debug("DEADS: #{@deads}")
  end

  def choose_vote_candidate(talk_history)
    @alives.sample
  end
end
